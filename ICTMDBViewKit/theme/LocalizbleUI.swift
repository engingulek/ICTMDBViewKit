//
//  LocalizbleUI.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import Foundation

public enum LocalizableUI: String {
    case homePageNavTitle
    case createdBy
    case firstDateAir
    case lastDateAir
    case overview
    case firstAirDate
    case episodes
    case cast
    case season
    case tvShowCount
    case somethingWentWrong
    case popular
    case airingToday

    public var localized: String {
        NSLocalizedString(self.rawValue, bundle: .module, comment: "\(self.rawValue) text")
    }
}
