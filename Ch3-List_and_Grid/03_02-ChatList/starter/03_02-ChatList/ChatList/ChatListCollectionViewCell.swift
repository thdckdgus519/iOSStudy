//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 송창현 on 1/28/24.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var chatProfile: UIImageView!
    @IBOutlet weak var chatName: UILabel!
    @IBOutlet weak var chatData: UILabel!
    @IBOutlet weak var chatDate: UILabel!
    
    override func awakeFromNib() { // awakeFromNib는 해당 Cell을 CollectionView에서 dequeue해 갈 때 가장 먼저 불리는 함수
        super.awakeFromNib()
        chatProfile.layer.cornerRadius = 20
    }
    
    func configure(_ data: Chat) {
        chatProfile.image = UIImage(named: data.name)
        chatName.text = data.name
        chatData.text = data.chat
        chatDate.text = convertDataFormat(data.date)
    }
    
    func convertDataFormat(_ data: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: data) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
}
