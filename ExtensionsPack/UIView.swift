//
//  UIView.swift
//
//  Created by Yaroslav Pasternak on 02.05.17.

import UIKit

private var activityIndicatorViewAssociativeKey = "ActivityIndicatorViewAssociativeKey"

public extension UIView {
    var  indicator: UIActivityIndicatorView {
        get {
            if let activityIndicatorView = getAssociatedObject(&activityIndicatorViewAssociativeKey)
                as? UIActivityIndicatorView {
                return activityIndicatorView
            } else {
                let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                activityIndicatorView.style = .gray
                activityIndicatorView.color = .gray
                activityIndicatorView.center = center
                activityIndicatorView.hidesWhenStopped = true
                addSubview(activityIndicatorView)
                
                setAssociatedObject(activityIndicatorView,
                                    associativeKey: &activityIndicatorViewAssociativeKey,
                                    policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return activityIndicatorView
            }
        }
        
        set {
            addSubview(newValue)
            setAssociatedObject(newValue,
                                associativeKey: &activityIndicatorViewAssociativeKey,
                                policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func currentFirstResponder() -> UIResponder? {
        if self.isFirstResponder {
            return self
        }
        for view in self.subviews {
            if let responder = view.currentFirstResponder() {
                return responder
            }
        }
        return nil
    }
    
    func contains(view: UIView) -> Bool {
        for subview in subviews {
            if subview.contains(view: view) {
                return true
            }
        }
        return false
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func removeRounding() {
        self.layer.mask = nil
    }
    
    var firstResponder: UIView? {
        if self.isFirstResponder { return self }
        for subview in subviews {
            if let responder = subview.firstResponder { return responder }
        }
        return nil
    }
    
    func addSubviews(_ items: UIView ...) {
        items.forEach(addSubview)
    }
}
