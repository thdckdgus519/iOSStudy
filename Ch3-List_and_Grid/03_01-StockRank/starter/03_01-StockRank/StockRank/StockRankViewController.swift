//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 송창현 on 1/27/24.
//

import UIKit


class StockRankViewController: UIViewController {

    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Collection View에서는 아래 3가지가 중요
            // Data - 어떤 데이터를 보여줄꺼야?
            // Presentation - 각 셀을 어떻게 표현할꺼야?
            // Layout - 각 셀을 어떻게 배치할꺼야?
        collectionView.dataSource = self // dataSource를 통해 Data / Presentation을 표현
        collectionView.delegate = self
    }
}


extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(stock: stockList[indexPath.item])
        return cell
    }
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
