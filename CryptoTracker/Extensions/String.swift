//
//  String.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 03.06.25.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
