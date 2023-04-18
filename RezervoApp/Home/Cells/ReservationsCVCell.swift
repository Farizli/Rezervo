//
//  ReservationsCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 01.04.23.
//

import UIKit

class ReservationsCVCell: UICollectionViewCell {
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var rateIcon: UIImageView!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var photo: UIImageView! {
        didSet {
            photo.layer.cornerRadius = 10
            photo.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    @IBOutlet weak var restaurantName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

