//
//  ChartView.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 02.06.25.
//

import SwiftUI

struct ChartView: View {
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    let lineColor: Color
    let startingDate: Date
    let endingDate: Date
    
    @State private var percentage: CGFloat = 0
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
        
        endingDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7*24*60*60)
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Path { path in
                    for index in data.indices {
                        
                        let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                        
                        let yAxis = maxY - minY
                        
                        let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                        
                        if index == 0 {
                            path.move(to: CGPoint(x: xPosition, y: yPosition))
                        }
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
                .trim(from: 0, to: percentage)
                .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .shadow(color: lineColor.opacity(0), radius: 10, x: 0.0, y: 10)
                .shadow(color: lineColor.opacity(1), radius: 10, x: 0.0, y: 10)
                .shadow(color: lineColor.opacity(0.5), radius: 10, x: 0.0, y: 10)
                .shadow(color: lineColor.opacity(0.2), radius: 10, x: 0.0, y: 20)
                .shadow(color: lineColor.opacity(0.1), radius: 10, x: 0.0, y: 30)
            }
            .frame(height: 200)
            .background(
                VStack {
                    Divider()
                        .background(Color.theme.secondary)
                    Spacer()
                    Divider()
                        .background(Color.theme.secondary)
                    Spacer()
                    Divider()
                        .background(Color.theme.secondary)
                }
            )
            .overlay(
                VStack {
                    Text(maxY.formattedWithAbbreviations())
                    Spacer()
                    let price = (maxY + minY) / 2
                    Text(price.formattedWithAbbreviations())
                    Spacer()
                    Text(minY.formattedWithAbbreviations())
                }
                .padding(.horizontal, 4)
                , alignment: .leading
            )
            
            HStack {
                Text(startingDate.asShortDateString())
                Spacer()
                Text(endingDate.asShortDateString())
            }
            .padding(.horizontal, 4)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondary)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.linear(duration: 2.0)) {
                    percentage = 1.0
                }
            }
        }
    }
}


#Preview {
    ChartView(coin: DeveloperPreview.instance.coin)
}
