//
//  ImageViewFactory.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import UIKit

// MARK: - ImageViewType
/// Defines the type of image view.
public enum ImageViewType {
    case background
    case main
}

// MARK: - ImageViewFactory
/// Factory for creating UIImageView instances with predefined styles.
public struct ImageViewFactory {
    
    /// Creates an image view of the specified type.
    /// - Parameter type: The desired image view type.
    /// - Returns: Configured UIImageView instance.
    @MainActor
    public static func createImageView(ofType type: ImageViewType) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        switch type {
        case .background:
            imageView.contentMode = .scaleAspectFill
            
        case .main:
            imageView.layer.cornerRadius = 8
            imageView.clipsToBounds = true
        }
        
        return imageView
    }
}
