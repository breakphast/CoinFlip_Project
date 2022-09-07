//
//  WebService.swift
//  CoinFlip_Gecko
//
//  Created by Desmond Fitch on 8/4/22.
//

import Foundation
import UIKit

class WebService {
    func getCoins(urls: [URL]) async throws -> [Coin] {
        return try await withThrowingTaskGroup(of: Coin.self, body: { taskGroup in
            var coins = [Coin]()
            
            urls.forEach { url in
                taskGroup.addTask {
                    let (data, response) = try await URLSession.shared.data(from: url)
                    
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        return Coin.DefaultCoin
                    }
                    
                    return try JSONDecoder().decode(Coin.self, from: data)
                }
            }
            
            for try await coin in taskGroup {
                coins.append(coin)
            }
            
            return coins
        })
    }
}
