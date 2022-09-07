//
//  Coin.swift
//  CoinFlip_Gecko
//
//  Created by Desmond Fitch on 8/4/22.
//

import Foundation

// MARK: - WelcomeElement
struct Coin: Codable {
    let symbol, name: String
    let marketData: MarketData
    let image: Image
    let marketCapRank: Int

    enum CodingKeys: String, CodingKey {
        case symbol, name, image
        case marketData = "market_data"
        case marketCapRank = "market_cap_rank"
    }
    
    static var DefaultCoin = Coin(symbol: "", name: "",
                                  marketData: MarketData(currentPrice: ["usd": 0.0], priceChange: ["usd": 0.0]),
                                  image: Image(large: ""),
                                  marketCapRank: 0)
}

struct MarketData: Codable {
    let currentPrice, priceChange: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case priceChange = "price_change_percentage_24h_in_currency"
    }
}

struct Image: Codable {
    let large: String
}
