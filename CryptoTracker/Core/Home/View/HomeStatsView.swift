//
//  HomeStatsView.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 01.06.25.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(viewModel.statistics) { stat in
                 StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.viewModel)
}
