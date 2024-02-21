//
//  HomeCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 송창현 on 2/20/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func prepareForReuse() {
        thumbnailImageView.image = nil
    }
    
    func configure(imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
