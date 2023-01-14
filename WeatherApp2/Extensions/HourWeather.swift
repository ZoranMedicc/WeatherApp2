//
//  HourWeather.swift
//  WeatherApp2
//
//  Created by Zoran Medic on 12.01.2023..
//

import Foundation
import WeatherKit

extension HourWeather: Hashable, Identifiable {
    public var id: Date {
        date
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
}
