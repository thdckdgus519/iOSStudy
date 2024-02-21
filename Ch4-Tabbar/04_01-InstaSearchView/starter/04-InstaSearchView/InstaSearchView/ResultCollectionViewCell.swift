//
//  ResultCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 송창현 on 2/6/24.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        thumbnailImageView.image = nil
    }
    
    func configure(name: String) {
        thumbnailImageView.image = UIImage(named: name)
    }
}
