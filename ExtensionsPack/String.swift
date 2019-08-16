//
//  String.swift
//  ExtensionsPack
//
//  Created by Yaroslav Pasternak on 27.02.2018.
//  Copyright © 2018 Thorax. All rights reserved.
//

import Foundation

public extension String {
    var base64data: Data? {
        return Data(base64Encoded: self)
    }
    
    var fromBase64: String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    var toBase64: String {
        return Data(self.utf8).base64EncodedString()
    }
    
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)   // "Mar 22, 2017, 10:22 AM"
    }
    
    var cSharpDate: Date? { return dateFromISO8601 }
    
    func split(by count: Int) -> [String] {
        return stride(from: 0, to: self.count, by: count).map { i -> String in
            let startIndex = self.index(self.startIndex, offsetBy: i)
            let endIndex = self.index(startIndex, offsetBy: count, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[startIndex..<endIndex])
        }
    }
}
