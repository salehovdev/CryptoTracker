//
//  MarketDataSergice.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 01.06.25.
//

import Foundation
import Combine

/*
 URL: https://api.coingecko.com/api/v3/global
 */

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] globalData in
                self?.marketData = globalData.data
            }
            .store(in: &cancellables)
    }
}
