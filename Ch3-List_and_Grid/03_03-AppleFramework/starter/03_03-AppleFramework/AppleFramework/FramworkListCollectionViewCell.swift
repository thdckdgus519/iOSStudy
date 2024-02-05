//
//  FramworkListCollectionViewCell.swift
//  AppleFramework
//
//  Created by 송창현 on 1/31/24.
//

import UIKit

class FramworkListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ data: AppleFramework) {
        thumbnailImageView.image = UIImage(named: data.imageName)
        nameLabel.text = data.name
    }
}
