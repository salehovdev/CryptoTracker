//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 27.05.25.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColomn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            leftColomn
            
            Spacer()
            if showHoldingColomn {
                centerColomn
            }
            
            rightColomn
        }
        .font(.subheadline)
        .background(Color.theme.background.opacity(0.001))
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColomn: true)
}

extension CoinRowView {
    private var leftColomn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondary)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var centerColomn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
    }
    
    private var rightColomn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                .bold()
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green :
                    Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
