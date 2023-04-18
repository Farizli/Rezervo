//
//  wideRestaurantCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 19.03.23.
//

import UIKit

class WideRestaurantCVCell: UICollectionViewCell {

    @IBOutlet weak var rateIcon: UIImageView!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var cuisineTitle: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var icon: UIImageView! {
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
