//
//  Color.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 27.05.25.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = Theme()
}

struct Theme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondary = Color("SecondaryTextColor")
}
