//
//  CoinListViewController.swift
//  CoinFlip_Gecko
//
//  Created by Desmond Fitch on 8/4/22.
//

import Foundation
import UIKit

class CoinListViewController: UITableViewController {
    
    private let vm = CoinListViewModel(coins: [Coin.DefaultCoin])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        Task {
            await getCoins()
        }
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "CoinFlip"
        tableView.register(CoinCell.self, forCellReuseIdentifier: "CoinCell")
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.coins.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? CoinCell else {
            fatalError("CoinCell is not defined.")
        }
        
        let coin = vm.coins[indexPath.row]
        cell.configure(coin)
        
        return cell
    }
    
    private func getCoins() async {
        await vm.getCoins(urls: Constants.coinURLs.allCoinURLs)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
