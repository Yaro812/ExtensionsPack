//
//  Decimal.swift
//
//  Created by Yaroslav Pasternak on 15.05.17.

import Foundation

public extension Decimal {
    public var double: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
