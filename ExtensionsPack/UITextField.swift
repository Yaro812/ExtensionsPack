//
//  UITextField.swift
//  ExtensionsPack
//
//  Created by user on 16/08/2019.
//  Copyright © 2019 Thorax. All rights reserved.
//

import UIKit

public extension UITextField {
    var decimalValue: Decimal { return Decimal(string: text ?? "0.0") ?? 0 }
    var isEmpty: Bool { return text.map { $0.isEmpty } ?? true }
}
