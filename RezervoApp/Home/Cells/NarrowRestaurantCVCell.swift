//
//  NarrowRestaurantCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 19.03.23.
//

import UIKit

class NarrowRestaurantCVCell: UICollectionViewCell {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!{
        didSet {
            icon.layer.cornerRadius = 15
            icon.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 15
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
