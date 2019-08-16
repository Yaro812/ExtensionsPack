//
//  Formatter.swift
//
//  Created by Yaroslav Pasternak on 06.06.17.

import Foundation

public extension Formatter {
    static var cSharp: DateFormatter { return iso8601 }
    
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
}
