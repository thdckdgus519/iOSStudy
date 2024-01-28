//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 송창현 on 1/28/24.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImage: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImage.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToDecimalFormat(price: stock.price)) 원"
        diffLabel.text = "\(stock.diff) %"
        diffLabel.textColor = checkPlus(diff: stock.diff) ? UIColor.systemRed : UIColor.systemBlue
    }
    
    func convertToDecimalFormat(price: Int) -> String {
        let decimalFormat = NumberFormatter()
        decimalFormat.numberStyle = .decimal
        decimalFormat.maximumFractionDigits = 0
        let returnValue = decimalFormat.string(from: NSNumber(value: price)) ?? ""
        
        return returnValue
    }
    
    func checkPlus(diff: Double) -> Bool {
        if diff >= 0 {
            return true
        }
        else {
            return false
        }
            
            
    }
}
