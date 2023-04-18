//
//  ReservationsTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 03.04.23.
//

import UIKit

class ReservationsTVCell: UITableViewCell {

    var rowNum: Int?
    @IBOutlet weak var cvHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "ReservationsCVCell", bundle: nil), forCellWithReuseIdentifier: "ReservationsCVCell")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(rowNum: Int) {
        self.rowNum = rowNum
        collectionView.reloadData()
    }

}

extension ReservationsTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowNum ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReservationsCVCell", for: indexPath) as! ReservationsCVCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 242, height: 228)
    }
    
}
