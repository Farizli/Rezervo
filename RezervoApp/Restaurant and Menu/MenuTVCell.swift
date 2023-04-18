//
//  MenuTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 14.04.23.
//

import UIKit

class MenuTVCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView! {
        didSet {
            photo.layer.cornerRadius = 10
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
