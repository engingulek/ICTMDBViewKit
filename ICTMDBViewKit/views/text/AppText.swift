//
//  AppText.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI


public enum AppTextStyle {
    case heroTitle
    case sectionHeader
    case cardTitle
    case cardSubTitle
    case body
    case caption
    case detailInfo
    case castName
    case castCharacter
    case error
}



public struct AppText: View {
   public init(text: String, style: AppTextStyle, color: Color? = nil) {
        self.text = text
        self.style = style
        self.color = color
    }
    
    let text: String
    let style: AppTextStyle
    var color: Color? = nil
    
   public var body: some View {
        content
            .foregroundColor(color ?? defaultColor)
    }
    
    @ViewBuilder
    private var content: some View {
        switch style {
        case .heroTitle:
            Text(text)
                .font(.system(size: 25, weight: .semibold))
                .lineLimit(1)
            
        case .sectionHeader:
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
            
        case .cardTitle:
            Text(text)
                .font(.system(size: 20, weight: .bold))
                .lineLimit(2)
            
        case .cardSubTitle:
            Text(text)
                .font(.system(size: 20, weight: .semibold))
            
        case .body:
            Text(text)
                .font(.body)
            
        case .caption:
            Text(text)
                .font(.caption)
                .fontWeight(.semibold)
            
        case .detailInfo:
            Text(text)
                .font(.system(size: 15, weight: .regular))
                .lineLimit(7)
            
        case .castName:
            Text(text)
                .font(.system(size: 16, weight: .bold))
                
        case .castCharacter:
            Text(text)
                .font(.system(size: 16, weight: .bold))
                
        case .error:
            Text(text)
                .font(.headline)
                .foregroundColor(.red)
        }
    }
    
    private var defaultColor: Color {
        switch style {
        case .heroTitle, .cardSubTitle, .detailInfo:
            return .white
        case .castCharacter:
            return .gray
        case .body:
            return .primary.opacity(0.8)
        default:
            return .primary
        }
    }
}
