//
//  UUID.swift
//
//  Created by Yaroslav Pasternak on 28.04.17.

import Foundation

public extension UUID {
    var bytes: [UInt8] {
        let str = self.uuidString.components(separatedBy: "-").joined()
        return str.split(by: 2).compactMap { UInt8($0, radix: 16) }
    }
    
    /**
     returns lowercased string without dashes
     */
    var noDashesString: String {
        return uuidString.lowercased().split(separator: "-").joined()
    }
}

extension UUID: Comparable {
    public static func < (lhs: UUID, rhs: UUID) -> Bool {
        let lBytes = lhs.bytes
        let rBytes = rhs.bytes
        for (idx, l) in lBytes.enumerated() where l != rBytes[idx] {
            return l < rBytes[idx] ? true : false
        }
        return false
    }
}
