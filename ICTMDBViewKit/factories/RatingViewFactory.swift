//
//  RatingViewFactory.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import UIKit

// MARK: - RatingViewType
/// Defines the type of rating view based on context.
public enum RatingViewType {
    case popular
    case airingToday
    case detail
}

// MARK: - RatingPresentation
/// Encapsulates the data needed to display a rating.
public struct RatingPresentation {
    let ratingScore: Double
    
    public init(ratingScore: Double) {
        self.ratingScore = ratingScore
    }
}

// MARK: - RatingViewFactory
/// Factory to create a RatingView instance based on type.
public final class RatingViewFactory {
    /// Creates and returns a RatingView for the specified type.
    @MainActor
    public static func createRatingView(with type: RatingViewType) -> RatingView {
        return RatingView(type: type)
    }
}

// MARK: - RatingView
/// Custom view that displays a circular rating with a score.
public final class RatingView: UIView {
    
    private let scoreLabel = UILabel()
    private let circleLayer = CAShapeLayer()
    private let type: RatingViewType
    
    // MARK: - Init
    public init(type: RatingViewType) {
        self.type = type
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .center
        
        addSubview(scoreLabel)
        layer.addSublayer(circleLayer)
        
        // Determine size and font based on type
        let (size, font): (CGFloat, UIFont) = {
            switch type {
            case .popular: return (36, .systemFont(ofSize: 13, weight: .bold))
            case .airingToday: return (40, .systemFont(ofSize: 15, weight: .semibold))
            case .detail: return (48, .systemFont(ofSize: 16, weight: .bold))
            }
        }()
        
        widthAnchor.constraint(equalToConstant: size).isActive = true
        heightAnchor.constraint(equalToConstant: size).isActive = true
        
        scoreLabel.font = font
        scoreLabel.textColor = RatingView.textColor(for: type)
        
        circleLayer.lineWidth = 4.0
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.gray.cgColor
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        circleLayer.path = UIBezierPath(ovalIn: bounds).cgPath
    }
    
    // MARK: - Update
    /// Updates the rating view with new data.
    public func update(with presentation: RatingPresentation) {
        scoreLabel.text = String(format: "%.1f", presentation.ratingScore)
        circleLayer.strokeColor = borderColor(for: presentation.ratingScore)
    }
    
    // MARK: - Helpers
    private func borderColor(for rating: Double) -> CGColor {
        switch rating {
        case 0.0..<6.0: return UIColor.systemRed.cgColor
        case 6.0..<8.0: return UIColor.systemOrange.cgColor
        case 8.0...10.0: return UIColor.systemGreen.cgColor
        default: return UIColor.gray.cgColor
        }
    }
    
    private static func textColor(for type: RatingViewType) -> UIColor {
        switch type {
        case .popular: return .white
        case .airingToday, .detail: return .black
        }
    }
}
