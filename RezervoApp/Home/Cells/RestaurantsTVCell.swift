//
//  RestaurantsTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 19.03.23.
//

import UIKit

enum CellType {
    case wide
    case narrow
}

class RestaurantsTVCell: UITableViewCell {
    
    var type: CellType?

    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setupCell(type: CellType) {
        
        print("type ---->", type)
        self.type = type
        contentView.layoutIfNeeded()
        self.collectionView.reloadData()
        switch type {
        case .narrow:
            tvHeight.constant = 218

        case .wide:
            tvHeight.constant = 211
        }
        tvHeight.isActive = true
        contentView.layoutSubviews()


    }
    
    

}

extension RestaurantsTVCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch type{
        case .wide:
            self.collectionView.register(UINib(nibName: "WideRestaurantCVCell", bundle: nil), forCellWithReuseIdentifier: "Wide")

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Wide", for: indexPath) as! WideRestaurantCVCell

            
            return cell
        case .narrow:
            
            self.collectionView.register(UINib(nibName: "NarrowRestaurantCVCell", bundle: nil), forCellWithReuseIdentifier: "Narrow")

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Narrow", for: indexPath) as! NarrowRestaurantCVCell
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch type {
        case .wide:
            return CGSize(width: 260, height: 211)
        case .narrow:
            return CGSize(width: 130, height: 218)
        default:
            return collectionView.contentSize
        }
    }
    
    
}
