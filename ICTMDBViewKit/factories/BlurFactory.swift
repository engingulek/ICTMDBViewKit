//
//  BlurFactory.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import UIKit

// MARK: - BlurStyle
///English: Defines the type of blur effect.
public enum BlurStyle {
    /// Dark blur style
    case dark
    /// Light blur style
    case light
    /// System blur style with custom UIBlurEffect.Style
    case system(UIBlurEffect.Style)
}

// MARK: - BlurFactory
/// Factory for creating a UIVisualEffectView with the specified blur style.
public struct BlurFactory {
    
    /// Creates a blur view of the given type.
    /// - Parameter type: The desired blur style.
    /// - Returns: Configured UIVisualEffectView with the specified blur effect.
    @MainActor
    public static func createBlurView(ofType type: BlurStyle) -> UIVisualEffectView {
        let effect: UIBlurEffect
        
        switch type {
        case .dark:
            effect = UIBlurEffect(style: .dark)
        case .light:
            effect = UIBlurEffect(style: .light)
        case .system(let style):
            effect = UIBlurEffect(style: style)
        }
        
        let blurView = UIVisualEffectView(effect: effect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }
}

