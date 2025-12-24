//
//  RatingView.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI

// MARK: - RatingViewType
public enum RatingViewType {
    case popular
    case airingToday
    case detail
    
    var size: CGFloat {
        switch self {
        case .popular: return 36
        case .airingToday: return 40
        case .detail: return 48
        }
    }
    
    var font: Font {
        switch self {
        case .popular: return .system(size: 13, weight: .bold)
        case .airingToday: return .system(size: 15, weight: .semibold)
        case .detail: return .system(size: 16, weight: .bold)
        }
    }
    
    var textColor: Color {
        switch self {
        case .popular: return .white
        case .airingToday, .detail: return .primary
        }
    }
}

// MARK: - RatingView
public struct RatingView: View {
    let score: Double
    let type: RatingViewType
    
    private var scoreColor: Color {
        switch score {
        case 0.0..<6.0: return .red
        case 6.0..<8.0: return .orange
        case 8.0...10.0: return .green
        default: return .gray
        }
    }
    
    public var body: some View {
        ZStack {
            if type == .airingToday {
                Circle()
                    .fill(Color.white)
            }
            Circle()
                .stroke(scoreColor.opacity(0.2), lineWidth: 3)
            Circle()
                .trim(from: 0, to: CGFloat(score / 10.0))
                .stroke(scoreColor, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Text(String(format: "%.1f", score))
                .font(type.font)
                .foregroundColor(type.textColor)
        }
        .frame(width: type.size, height: type.size)
        .shadow(color: type == .airingToday ? .black.opacity(0.1) : .clear, radius: 2)
    }
}


#Preview("Airing Today") {
    VStack {
        RatingView(score: 5.0, type: .airingToday)
        RatingView(score: 7.5, type: .airingToday)
        RatingView(score: 8.0, type: .airingToday)
    }
}


#Preview("Popular") {
    VStack {
        RatingView(score: 5.0, type:.popular)
        RatingView(score: 7.5, type: .popular)
        RatingView(score: 8.0, type: .popular)
    }
    .background(.black)
}
