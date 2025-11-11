//
//  UIColor+Extension(s).swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//
import UIKit

public extension UIColor {
    
    #if SWIFT_PACKAGE
    public convenience init?(name: String) {
        let bundle = Bundle.module
        self.init(named: name, in: bundle, compatibleWith: nil)
    }
    #else
    public convenience init?(name: String) {
        let bundle = Bundle(for: UIColor.self) // <-- burayı değiştiriyoruz
        self.init(named: name, in: bundle, compatibleWith: nil)
    }
    #endif
    
    static let backgroundColor = UIColor(name: "backColor")
}

