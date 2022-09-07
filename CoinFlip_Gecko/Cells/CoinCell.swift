//
//  CoinCell.swift
//  CoinFlip_Gecko
//
//  Created by Desmond Fitch on 8/5/22.
//

import Foundation
import UIKit
import SDWebImage

class CoinCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceChangeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coinIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 20, y: 25, width: 30, height: 30)
        return imageView
    }()
    
    private let buyButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.buttonSize = .medium
        filled.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        filled.baseBackgroundColor = UIColor.systemOrange
        filled.cornerStyle = .large
        
        
        var attText = AttributedString.init("Buy")
        attText.font = UIFont.boldSystemFont(ofSize: 14)
        filled.attributedTitle = attText
        
        let button = UIButton(configuration: filled, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sellButton: UIButton = {
        var tinted = UIButton.Configuration.tinted()
        tinted.buttonSize = .medium
        tinted.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        tinted.baseBackgroundColor = UIColor.systemOrange
        tinted.baseForegroundColor = UIColor.systemOrange
        tinted.cornerStyle = .large
        
        var attText = AttributedString.init("Sell")
        attText.font = UIFont.boldSystemFont(ofSize: 14)
        tinted.attributedTitle = attText
        
        let button = UIButton(configuration: tinted, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(coinIconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(priceChangeLabel)
        contentView.addSubview(coinIconView)
        contentView.addSubview(buyButton)
        contentView.addSubview(sellButton)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(_ coin: Coin) {
        nameLabel.text = coin.name
        symbolLabel.text = coin.symbol.uppercased()
        
        let formattedPriceLabel = String(format: "%.2f", coin.marketData.currentPrice["usd"] ?? 0)
        priceLabel.text = "$\(formattedPriceLabel)"
        
        let formattedPriceChangeLabel = String(format: "%.1f", coin.marketData.priceChange["usd"] ?? 0.0)
        priceChangeLabel.textColor = coin.marketData.priceChange["usd"] ?? 0.0 > 0 ? UIColor.systemGreen : UIColor.systemRed
        priceChangeLabel.text = "\(formattedPriceChangeLabel)%"
        
        coinIconView.sd_setImage(with: URL(string: coin.image.large), completed: nil)
    }
            
    public func configureConstraints() {
        let titleAndSubtitleLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 65),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            symbolLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22)
        ]
        
        let priceAndPriceChangeLabelConstraints = [
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceChangeLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),
            priceChangeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
        ]
        
        let buyAndSellButtonConstraints = [
            buyButton.trailingAnchor.constraint(equalTo: sellButton.leadingAnchor, constant: -5),
            buyButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            sellButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titleAndSubtitleLabelConstraints)
        NSLayoutConstraint.activate(priceAndPriceChangeLabelConstraints)
        NSLayoutConstraint.activate(buyAndSellButtonConstraints)
    }
}
