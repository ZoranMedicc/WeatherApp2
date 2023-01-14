//
//  ImageExtension.swift
//  WeatherApp2
//
//  Created by Zoran Medic on 12.01.2023..
//

import Foundation
import SwiftUI

extension Image {
    static func symbol(symbolName: String, size: Double = 50) -> some View {
        Image(systemName: symbolName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: size)
    }
}
