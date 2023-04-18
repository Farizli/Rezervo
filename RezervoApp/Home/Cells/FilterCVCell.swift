//
//  FilterCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 01.04.23.
//

import UIKit

class FilterCVCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderWidth = 0.5
            containerView.layer.borderColor = ColorUI.grayBorder.cgColor
            containerView.layer.cornerRadius = contentView.frame.height/2 - 10
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(title: String) {
        titleLbl.text = title
    }

}
