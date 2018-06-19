//
//  JSONDecoder.swift
//  ExtensionsPack
//
//  Created by Yaroslav Pasternak on 19.06.2018.
//  Copyright © 2018 Thorax. All rights reserved.
//

import Foundation

public extension JSONDecoder.KeyDecodingStrategy {
    public static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { codingKeys in

            var key = AnyCodingKey(codingKeys.last!)

            // lowercase first letter
            if let firstChar = key.stringValue.first {
                let i = key.stringValue.startIndex
                key.stringValue.replaceSubrange(
                    i...i, with: String(firstChar).lowercased()
                )
            }
            return key
        }
    }
}

// MARK: AnyCodingKey helper struct
public struct AnyCodingKey: CodingKey, Equatable {
    public var stringValue: String
    public var intValue: Int?

    public init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    public init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    public init(_ base: CodingKey) {
        if let intValue = base.intValue {
            self.init(intValue: intValue)!
        } else {
            self.init(stringValue: base.stringValue)!
        }
    }
}

extension AnyCodingKey: Hashable {
   public var hashValue: Int {
        return self.intValue?.hashValue ?? self.stringValue.hashValue
    }
}
