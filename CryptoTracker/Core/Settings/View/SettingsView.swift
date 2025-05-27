//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 03.06.25.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let githubURL = URL(string: "https://github.com/salehovdev")!
    let linkedinURL = URL(string: "www.linkedin.com/in/fuad-salehov")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationStack {
            List {
                githubSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var githubSection: some View {
        Section("Salehovdev") {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 20))
                Text("This app was made by @salehovdev. MVVM Architecture, Combine and CoreData was used for this app.")
                    .font(.callout)
                    .fontWeight(.medium)
            }
            .padding(.vertical)
            
            Link("Follow me in Github", destination: githubURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section("CoinGecko") {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(.rect(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from free API from CoinGecko!")
                    .font(.callout)
                    .fontWeight(.medium)
            }
            .padding(.vertical)
            
            Link("Visit CoinGecko", destination: coingeckoURL)
        }
    }
    
    private var developerSection: some View {
        Section("Developer") {
            VStack(alignment: .leading) {
                Image("fuad")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(.circle)
                Text("This app was developed by me, Fuad Salehov!")
                    .font(.callout)
                    .fontWeight(.medium)
            }
            .padding(.vertical)
            
            Link("Connect with me in Linkedin", destination: linkedinURL)
        }
    }
    
    private var applicationSection: some View {
        Section("Application") {
            Link("Terms of Service", destination: linkedinURL)
            Link("Privacy Policy", destination: linkedinURL)
            Link("Company Website", destination: linkedinURL)
            Link("Learn more", destination: linkedinURL)
        }
    }
}
