//
//  AppKFImage.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 24.12.2025.
//
import Foundation
import Kingfisher
import SwiftUI

// 1. Remote ve System için ayrı tip kısıtlamaları yapıyoruz
enum AppImageType {
    case backgroundBlur
    case main
}

enum AppIconType {
    case icon(size: CGSize, color: Color)
}


enum ImageSource {
    case remote(url: String?, type: AppImageType)
    case system(name: String, type: AppIconType)
}

struct AppImage: View {
    let source: ImageSource
    var body: some View {
        Group {
            switch source {
            case .remote(let urlString, let type):
                KFImage.url(URL(string: urlString ?? ""))
                    .placeholder { Color.gray.opacity(0.1) }
                    .fade(duration:  0.25)
                    .memoryCacheExpiration(.seconds(1))
                    .diskCacheExpiration(.days(7))
                    .cacheMemoryOnly(true)
                    .resizable()
                    .modifier(AppImageTypeStyleModifier(type: .image(type)))
                
            case .system(let name, let iconType):
                Image(systemName: name)
                    .resizable()
                    .modifier(AppImageTypeStyleModifier(type: .icon(iconType)))
            }
        }
    }
}


#Preview("Main") {
    AppImage(
        source: .remote(
            url: "https://www.themoviedb.org/t/p/w1280/bL1mwXDnH5fCxqc4S2n40hoVyoe.jpg",
            type: .main))
}

#Preview("Backgroud Blur") {
    AppImage(
        source: .remote(
            url: "https://www.themoviedb.org/t/p/w1280/bL1mwXDnH5fCxqc4S2n40hoVyoe.jpg",
            type: .backgroundBlur))
    .aspectRatio(contentMode: .fit)
}

#Preview("Icon") {
    AppImage(
        source:.system(name: "circle.fill", type: .icon(size: .init(width: 40, height: 40), color: .green)))
    .aspectRatio(contentMode: .fit)
}


