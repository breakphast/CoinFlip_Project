//
//  Constants.swift
//  CoinFlip_Gecko
//
//  Created by Desmond Fitch on 8/4/22.
//

import Foundation

struct Constants {
    struct coinURLs {
        static let allCoinURLs = [
            URL(string: "https://api.coingecko.com/api/v3/coins/bitcoin")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/ethereum")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/tether")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/usd-coin")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/binancecoin")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/ripple")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/binance-usd")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/cardano")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/solana")!,
            URL(string: "https://api.coingecko.com/api/v3/coins/polkadot")!,
        ]
    }
}
