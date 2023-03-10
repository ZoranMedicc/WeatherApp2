//
//  WeatherServiceExtension.swift
//  WeatherApp2
//
//  Created by Zoran Medic on 12.01.2023..
//

import Foundation
import CoreLocation
import SwiftUI
import WeatherKit

extension WeatherService {
    static let days = 5

    func hourlyForecast(for location: CLLocation) async -> [HourWeather] {
        let forecast = try? await weather(
            for: location,
            including: .hourly
        )
        return forecast?.forecast ?? []
    }

    func summary(
        for location: CLLocation,
        colorScheme _: ColorScheme
    ) async throws -> WeatherSummary {
        let weather = try await weather(for: location)
        let current = weather.currentWeather

        let wind = current.wind
        let windSpeed = wind.speed.formatted()
        let windDirection = wind.compassDirection

        let forecast = await hourlyForecast(for: location)

        // Only keep forecasts from midnight this morning
        // to a given number of days in the future.
        let startDate = Date().startOfDay
        let endDate = startDate.addingTimeInterval(
            Double((Self.days * 24 - 1) * 60 * 60)
        )

        let keepForecast = forecast.filter {
            startDate <= $0.date && $0.date <= endDate
        }

        let attr = try await attribution

        return WeatherSummary(
            condition: current.condition.description,
            symbolName: current.symbolName,
            temperature: current.temperature.converted(to: .celsius),
            wind: "\(windSpeed) from \(windDirection)",
            hourlyForecast: keepForecast,
            attributionLightLogoURL: attr.combinedMarkLightURL,
            attributionDarkLogoURL: attr.combinedMarkDarkURL,
            attributionPageURL: attr.legalPageURL
        )
    }
}
