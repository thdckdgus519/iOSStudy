//
//  FramworkListViewController.swift
//  AppleFramework
//
//  Created by 송창현 on 1/31/24.
//

import UIKit

class FramworkListViewController: UIViewController {

    let frameworkData: [AppleFramework] = AppleFramework.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.title = "Apple Frameworks"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}

extension FramworkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return frameworkData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FramworkListCollectionViewCell", for: indexPath) as? FramworkListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(frameworkData[indexPath.item])
        return cell
    }
}

extension FramworkListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 3) / 4
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
}

extension FramworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = frameworkData[indexPath.item]
        print("\(framework.name)")
    }
}
