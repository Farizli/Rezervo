//
//  CustomSegmentCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 12.04.23.
//

import UIKit

class CustomSegmentCVCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(title: String, isSelected: Bool) {
        self.title.text = title
        UIView.transition(with: self.title, duration: 2) {
            self.title.textColor = isSelected ? ColorUI.mainText : ColorUI.grayText
        }
    }

}
