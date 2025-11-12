//
//  LanguageFlags.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

public struct LanguageFlags {
    
    public static func flag(for languageCode: String) -> String {
        let mapping: [String: String] = [
            "en": "🇬🇧",
            "af": "🇿🇦",
            "pl": "🇵🇱",
            "tr": "🇹🇷",
            "es": "🇪🇸",
            "fr": "🇫🇷",
            "de": "🇩🇪",
            "it": "🇮🇹",
            "pt": "🇵🇹",
            "ja": "🇯🇵",
            "ko": "🇰🇷",
            "zh": "🇨🇳",
            "el": "🇬🇷"
        ]
        
        let code = languageCode.lowercased()
        return mapping[code] ?? "🏳️"
    }
}
