//
//  LabelFactory.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//


import UIKit

// MARK: - LabelType
/// Defines different types of labels with specific fonts and styles.
public enum LabelType {
    case cellLargeTitle(weight: UIFont.Weight)
    case cellMedium(weight: UIFont.Weight)
    case cellSmall(weight: UIFont.Weight)
    case msLabel(weight: UIFont.Weight)
    case errorMessageLabel
}

// MARK: - LabelFactory
/// Factory to create UILabel instances with predefined styles.
public struct LabelFactory {
    
    /// Creates a UILabel of the specified type with color, alignment, and number of lines.
    /// - Parameters:
    ///   - type: The desired label type.
    ///   - textColor: The text color of the label.
    ///   - alignment: Text alignment, default is natural.
    ///   - numberOfLines: Number of lines, default is 0 (unlimited).
    /// - Returns: Configured UILabel instance.
    @MainActor
    public static func createLabel(
        ofType type: LabelType,
        textColor: UIColor,
        alignment: NSTextAlignment = .natural,
        numberOfLines: Int = 0
    ) -> UILabel {
        
        let label = UILabel()
        label.textColor = textColor
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        
        switch type {
        case .cellLargeTitle(let weight):
            label.font = .systemFont(ofSize: 25, weight: weight)
            
        case .cellMedium(let weight):
            label.font = .systemFont(ofSize: 20, weight: weight)
            
        case .cellSmall(let weight):
            label.font = .systemFont(ofSize: 15, weight: weight)
            
        case .msLabel(let weight):
            label.font = .systemFont(ofSize: 18, weight: weight)
            
        case .errorMessageLabel:
            label.font = .systemFont(ofSize: 15, weight: .semibold)
            label.textColor = .red
        }
        
        return label
    }
}
