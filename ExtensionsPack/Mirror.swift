//
//  Mirror.swift
//
//  Created by Yaroslav Pasternak on 12.05.17.

import Foundation

public extension Mirror {
    public var dictionary: [String: Any] {
        var dict: [String: Any] = [:]
        children.forEach { child in child.label.map { label in dict[label] = child.value } }
        return dict
    }
}
