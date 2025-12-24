//
//  AppImageStyle.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 24.12.2025.
//
import Foundation
import SwiftUI

// Modifier'ın anlayacağı ortak dil
public enum InternalImageType {
    case image(AppImageType)
    case icon(AppIconType)
}

struct AppImageTypeStyleModifier: ViewModifier {
    let type: InternalImageType

    func body(content: Content) -> some View {
        switch type {
        case .image(let style):
            if style == .backgroundBlur {
                content
                    .aspectRatio(contentMode: .fill)
                    .layoutPriority(-1)
                    .blur(radius: 10)
                    .overlay(Color.black.opacity(0.2))
            } else {
                content
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
            }
            
        case .icon(let iconStyle):
            if case .icon(let size, let color) = iconStyle {
                content
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height)
                    .foregroundStyle(color)
            }
        }
    }
}
