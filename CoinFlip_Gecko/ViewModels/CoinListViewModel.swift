//
//  CoinListViewModel.swift
//  CoinFlip_Gecko
//
//  Created by Desmond Fitch on 8/4/22.
//

import Foundation

class CoinListViewModel {
    private(set) var coins: [Coin]
    
    init(coins: [Coin]) {
        self.coins = coins
    }
    
    func getCoins(urls: [URL]) async {
        do {
            let coins = try await WebService().getCoins(urls: Constants.coinURLs.allCoinURLs)
            self.coins = coins.sorted{ $0.marketCapRank < $1.marketCapRank }
        } catch {
            print(error)
        }
    }
}
