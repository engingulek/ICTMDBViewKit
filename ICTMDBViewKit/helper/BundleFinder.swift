//
//  BundleFinder.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 20.12.2025.
//

import Foundation


private class BundleFinder {}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    /// This custom implementation handles cases where the default .module access might fail in unit tests.
    static let kitModule: Bundle = {
        let bundleName = "ICTMDBViewKit_ICTMDBViewKit"
        
        // Strategy 1: Look for the bundle in potential candidate directories
        // In some test environments, the default .module property is not accessible.
        // We manually check common locations where the resource bundle might reside.
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL
        ]
        
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        
        // Strategy 2: Fallback to the bundle containing the BundleFinder class
        // This is particularly useful for unit tests running in a different target.
        return Bundle(for: BundleFinder.self)
    }()
}
