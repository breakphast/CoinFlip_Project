//
//  MainTabBarViewController.swift
//  CoinFlip_Gecko
//
//  Created by Desmond Fitch on 8/6/22.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondaryLabel
        
        let home = UINavigationController(rootViewController: CoinListViewController())
        let nilView1 = UINavigationController(rootViewController: CoinListViewController())
        let nilView2 = UINavigationController(rootViewController: CoinListViewController())
        let nilView3 = UINavigationController(rootViewController: CoinListViewController())
        
        home.tabBarItem.image = UIImage(systemName: "house.fill")
        nilView1.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        nilView2.tabBarItem.image = UIImage(systemName: "bitcoinsign.circle.fill")
        nilView3.tabBarItem.image = UIImage(systemName: "person.fill")
        
        home.title = "Home"
        nilView1.title = "Search"
        nilView2.title = "Coins"
        nilView3.title = "Account"
        
        tabBar.tintColor = .systemOrange
        tabBar.unselectedItemTintColor = .label
        
        setViewControllers([home, nilView1, nilView2, nilView3], animated: true)
    }
}
