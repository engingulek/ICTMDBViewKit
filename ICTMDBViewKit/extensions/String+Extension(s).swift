//
//  String+Extension(String).swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import Foundation
extension String {
   /// convert MMMM dd, yyyy
   public func toLongDateString() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = inputFormatter.date(from: self) else { return nil }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMMM dd, yyyy"
        outputFormatter.locale = Locale(identifier: "en_US")
        
        return outputFormatter.string(from: date)
    }
}
