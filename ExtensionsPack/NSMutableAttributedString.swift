//
//  NSMutableAttributedString.swift
//  ExtensionsPack
//
//  Created by user on 16/08/2019.
//  Copyright © 2019 Thorax. All rights reserved.
//

import Foundation

public extension NSMutableAttributedString {
    func add(font: UIFont, range: NSRange?) -> NSMutableAttributedString {
        let range = range ?? NSRange(location: 0, length: self.length)
        addAttribute(.font, value: font, range: range)
        return self
    }
    
    func add(alignment: NSTextAlignment) -> NSMutableAttributedString {
        let range = NSRange(location: 0, length: self.length)
        let style = NSMutableParagraphStyle()
        style.alignment = alignment
        addAttribute(.paragraphStyle, value: style, range: range)
        return self
    }
    
    func add(fontColor: UIColor, range: NSRange?) -> NSMutableAttributedString {
        let range = range ?? NSRange(location: 0, length: self.length)
        addAttribute(.foregroundColor, value: fontColor, range: range)
        return self
    }
    
    func add(lineInterval: CGFloat, range: NSRange?) -> NSMutableAttributedString {
        let range = range ?? NSRange(location: 0, length: self.length)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineInterval
        addAttribute(.paragraphStyle, value: style, range: range)
        return self
    }
    
    func add(link: String, to substring: String) -> NSMutableAttributedString {
        let range = (self.string as NSString).range(of: substring)
        addAttribute(.link, value: link, range: range)
        return self
    }
}
