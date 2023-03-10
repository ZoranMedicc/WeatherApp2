//
//  DateExtension.swift
//  WeatherApp2
//
//  Created by Zoran Medic on 12.01.2023..
//

import Foundation

extension Date {
    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }

    // This returns 1 for Sunday and 7 for Saturday.
    var dayOfWeekNumber: Int {
        Calendar.current.dateComponents([.weekday], from: self).weekday!
    }

    // Returns a String representation of the Date
    // showing only the hour and AM|PM.
    var h: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        return dateFormatter.string(from: self)
    }

    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }

    // Returns a String representation of the Date in "M/d" format.
    var md: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d"
        return dateFormatter.string(from: self)
    }

    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    func removeSeconds() -> Date {
        let components = Calendar.current.dateComponents(
            [.year, .month, .day, .hour], // not seconds or nanoseconds
            from: self
        )
        return Calendar.current.date(from: components)!
    }
}

