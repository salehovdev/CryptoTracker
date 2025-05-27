//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 27.05.25.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .toolbar(.hidden)
        }
        .environmentObject(viewModel)
    }
}
