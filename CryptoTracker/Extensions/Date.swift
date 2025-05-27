//
//  Date.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 02.06.25.
//

import Foundation

extension Date {
    
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        if let parsedDate = formatter.date(from: coinGeckoString) {
            self = parsedDate
        } else {
            self = Date()
        }
    }
    
    func asShortDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
