//
//  CategoryCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 13.03.23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.cornerradius = 10
        }
    }
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var subText: UILabel!
    @IBOutlet weak var image: UIImageView! {
        didSet {
            image.cornerradius = 10
        }
    }
    
    
    func setupCell(mainText: String, subText: String, image: UIImage) {
        self.mainText.text = mainText
        self.subText.text = subText
        self.image.image = image
        
    }
}

