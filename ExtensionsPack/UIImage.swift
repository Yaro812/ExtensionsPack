//
//  UUID.swift
//
//  Created by Yaroslav Pasternak on 16.08.19.

import UIKit

public extension UIImage {
    static func render(size: CGSize, _ draw: () -> Void) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer { UIGraphicsEndImageContext() }
        
        draw()
        
        return UIGraphicsGetImageFromCurrentImageContext()?
            .withRenderingMode(.alwaysTemplate)
    }
    
    static func make(size: CGSize = CGSize(width: 1, height: 1), color: UIColor = .white) -> UIImage? {
        return render(size: size) {
            color.setFill()
            UIRectFill(CGRect(origin: .zero, size: size))
        }
    }
    
    func textEmbeded(string: String, isImageBeforeText: Bool = true, segFont: UIFont? = nil) -> UIImage {
        return UIImage.textEmbeded(image: self,
                                   string: string,
                                   isImageBeforeText: isImageBeforeText,
                                   segFont: segFont)
    }
    
    static func textEmbeded(image: UIImage,
                            string: String,
                            isImageBeforeText: Bool,
                            segFont: UIFont? = nil) -> UIImage {
        let font = segFont ?? UIFont.systemFont(ofSize: 16)
        let expectedTextSize = (string as NSString).size(withAttributes: [.font: font])
        let width = expectedTextSize.width + image.size.width + 5
        let height = max(expectedTextSize.height, image.size.width)
        let size = CGSize(width: width, height: height)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            let fontTopPosition: CGFloat = (height - expectedTextSize.height) / 2
            let textOrigin: CGFloat = isImageBeforeText
                ? image.size.width + 5
                : 0
            let textPoint = CGPoint(x: textOrigin, y: fontTopPosition)
            string.draw(at: textPoint, withAttributes: [.font: font])
            let alignment: CGFloat = isImageBeforeText
                ? 0
                : expectedTextSize.width + 5
            let rect = CGRect(x: alignment,
                              y: (height - image.size.height) / 2,
                              width: image.size.width,
                              height: image.size.height)
            image.draw(in: rect)
        }
    }
}
