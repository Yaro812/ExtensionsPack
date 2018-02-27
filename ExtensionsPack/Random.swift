//
//  Random.swift
//
//  Created by Yaroslav Pasternak on 26.04.17.

import Foundation

/// Generates random numbers
public struct Random {
    /// Integer random in range from value included to value excluded
    public static func range(from: Int = 0, to: Int) -> Int {
        guard from < to else {
            return to
        }
        
        var offset = 0
        if from < 0 {
            offset = abs(from)
        }
        
        let mini = UInt32(from + offset)
        let maxi = UInt32(to + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
    
    public static var bool: Bool { return range(from: 0, to: 2) > 0 ? true : false }
}
