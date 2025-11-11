//
//  UIActivityIndicatorView+Extension(s).swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import UIKit
// MARK: - UIActivityIndicatorView Extension
/// An extension for `UIActivityIndicatorView` to provide a custom base activity indicator.
extension UIActivityIndicatorView {
    static public func baseActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = .black
        indicator.style = .large
        return indicator
    }
}
