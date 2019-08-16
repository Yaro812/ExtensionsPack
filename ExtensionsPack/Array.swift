//
//  Array.swift
//  ExtensionsPack
//
//  Created by user on 16/08/2019.
//  Copyright © 2019 Thorax. All rights reserved.
//

import Foundation

public extension Array {
    func enumeratedDescription() -> String {
        return self.enumerated().reduce(into: "") { $0 += "\($1.0). \($1.1)\n" }
    }
}
