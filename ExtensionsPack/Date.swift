//
//  Date.swift
//
//  Created by Yaroslav Pasternak on 13.05.17.

import Foundation

public extension Date {
    static var midnight: Date { return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())! }
    static var tomorrow: Date { return  Calendar.current.date(byAdding: .day, value: 1, to: midnight)! }
    
    var cSharpString: String { return iso8601 }
    
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
    
    // C# timestamp format
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
    
    var lastSecond: Date {
        return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
    }
    
    /// Makes Swift date from C# timestamp format
    /// - parameter ticks: C# timestamp in nanoseconds
    init(ticks: UInt64) {
        self.init(timeIntervalSince1970: Double(ticks) / 10_000_000 - 62_135_596_800)
    }
    
    func nearestHalfHour() -> Date {
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: self)
        if minutes < 30 {
            return calendar.date(bySetting: .minute, value: 30, of: self)!
        } else {
            return calendar.date(bySetting: .minute, value: 0, of: self)!
        }
    }

    func interval(of component: Calendar.Component, since date: Date) -> Int {
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: component, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: component, in: .era, for: self) else { return 0 }
        
        return end - start
    }
    
}
