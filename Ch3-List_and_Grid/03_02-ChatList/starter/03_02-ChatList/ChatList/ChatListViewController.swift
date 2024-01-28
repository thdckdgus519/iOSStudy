//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 송창현 on 1/28/24.
//

import UIKit

class ChatListViewController: UIViewController {

    var chatData: [Chat] = Chat.list

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        chatData = chatData.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        }
        );
        // Sorted는 구조체/클래스가 Comparable 프로토콜을 구현하면 사용 가능
        // sorted(by: 클로저)에서 위 코드 의미는,
        // 데이터 2개를 비교해서 chat1 > chat2를 항상 만족하게 sorting하라는뜻
        // chat1이 데이터 중 앞쪽
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
        
//extension Chat: Comparable {
//    static func < (lhs: Chat, rhs: Chat) -> Bool {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        
//        let lhsDate = dateFormatter.date(from: lhs.date) ?? Date()
//        let rhsDate = dateFormatter.date(from: rhs.date) ?? Date()
//        
//        return lhsDate > rhsDate
//    }
//    
//    static func == (lhs: Chat, rhs: Chat) -> Bool {
//        return lhs.date == rhs.date
//    }
//}

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(chatData[indexPath.item])
        return cell
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
