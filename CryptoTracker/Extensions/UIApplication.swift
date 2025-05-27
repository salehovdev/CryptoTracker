//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 01.06.25.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
