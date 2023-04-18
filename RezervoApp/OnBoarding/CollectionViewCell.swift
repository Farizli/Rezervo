//
//  CollectionViewCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 23.02.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(title: String, image: UIImage) {
        self.photo.image = image
        self.title.text = title
    }
}
