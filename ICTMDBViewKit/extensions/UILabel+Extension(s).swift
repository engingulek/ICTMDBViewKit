//
//  UILabel+Extension(s).swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//
import UIKit
public extension UILabel {
    func setAttributedText(
        title: String,
        value: String,
        boldAttributes: [NSAttributedString.Key: Any], normalAttributes: [NSAttributedString.Key: Any]) {
            
        let attributed = NSMutableAttributedString(string: "\(title): ", attributes: boldAttributes)
        attributed.append(NSAttributedString(string: value, attributes: normalAttributes))
        self.attributedText = attributed
            
    }
}
