//
//  WeatherSummary.swift
//  WeatherApp2
//
//  Created by Zoran Medic on 12.01.2023..
//


import Foundation // for URL
import WeatherKit

struct WeatherSummary: Equatable {
    let condition: String
    let symbolName: String
    let temperature: Measurement<UnitTemperature>
    let wind: String
    let hourlyForecast: [HourWeather]
    let attributionLightLogoURL: URL
    let attributionDarkLogoURL: URL
    let attributionPageURL: URL
}
