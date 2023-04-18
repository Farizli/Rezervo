//
//  OnBoardCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 23.02.23.
//

import UIKit

class OnBoardCVCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var iamge: UIImageView!
    
    
    func setUpCell(title: String, image: UIImage) {
        self.title.text = title
        self.iamge.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
