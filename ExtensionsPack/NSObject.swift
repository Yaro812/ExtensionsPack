//
//  NSObject.swift
//
//  Created by Yaroslav Pasternak on 02.05.17.

import Foundation

public extension NSObject {
    public func setAssociatedObject(_ value: AnyObject?,
                                    associativeKey: UnsafeRawPointer,
                                    policy: objc_AssociationPolicy) {
        if let valueAsAnyObject = value {
            objc_setAssociatedObject(self, associativeKey, valueAsAnyObject, policy)
        }
    }
    
    public func getAssociatedObject(_ associativeKey: UnsafeRawPointer) -> Any? {
        guard let valueAsType = objc_getAssociatedObject(self, associativeKey) else {
            return nil
        }
        return valueAsType
    }
}
