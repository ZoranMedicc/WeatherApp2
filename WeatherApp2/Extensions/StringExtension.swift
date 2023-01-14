//
//  StringExtension.swift
//  WeatherApp2
//
//  Created by Zoran Medic on 12.01.2023..
//

import Foundation

extension String: LocalizedError {
    // Allows String values to be thrown.
    public var errorDescription: String? { self }
}
