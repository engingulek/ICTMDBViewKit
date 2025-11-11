//
//  StackViewType.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import UIKit

// MARK: - StackViewType
/// Defines common stack view configurations with axis and spacing.
public enum StackViewType {
    /// Horizontal stack view with small spacing
    case horizontalSpacingSmall
    /// Horizontal stack view with medium spacing
    case horizontalSpacingMedium
    /// Horizontal stack view with large spacing
    case horizontalSpacingLarge
    /// Vertical stack view with small spacing
    case verticalSpacingSmall
    /// Vertical stack view with medium spacing
    case verticalSpacingMedium
    /// Vertical stack view with large spacing
    case verticalSpacingLarge
    
    // MARK: - Computed Properties
    /// Returns the axis based on stack view type
    var axis: NSLayoutConstraint.Axis {
        switch self {
        case .horizontalSpacingSmall, .horizontalSpacingMedium, .horizontalSpacingLarge:
            return .horizontal
        case .verticalSpacingSmall, .verticalSpacingMedium, .verticalSpacingLarge:
            return .vertical
        }
    }
    
    /// Returns the spacing value based on stack view type
    var spacing: CGFloat {
        switch self {
        case .horizontalSpacingSmall, .verticalSpacingSmall:
            return 6
        case .horizontalSpacingMedium, .verticalSpacingMedium:
            return 12
        case .horizontalSpacingLarge, .verticalSpacingLarge:
            return 20
        }
    }
}

// MARK: - StackViewFactory
/// Factory to create UIStackView instances with predefined styles.
public struct StackViewFactory {
    
    /// Creates a stack view of the specified type with optional alignment and distribution.
    /// - Parameters:
    ///   - type: The desired stack view type
    ///   - alignment: Alignment of arranged subviews, default is .center
    ///   - distribution: Distribution of arranged subviews, default is .fill
    /// - Returns: Configured UIStackView instance
    @MainActor
    public static func createStackView(
        ofType type: StackViewType,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = type.axis
        stackView.spacing = type.spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        return stackView
    }
}
