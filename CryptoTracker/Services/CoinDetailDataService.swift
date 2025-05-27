//
//  CoinDetailDataService.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 02.06.25.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    var cancellables = Set<AnyCancellable>()
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        
        guard let url = URL(string: "") else { return }
        
        NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] coinDetails in
                self?.coinDetails = coinDetails
            }
            .store(in: &cancellables)
    }
}
