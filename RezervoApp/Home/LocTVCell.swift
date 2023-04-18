//
//  LocTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit

class LocTVCell: UITableViewCell {

    @IBOutlet weak var locTitle: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(image: UIImage, title: String) {
        self.locTitle.text = title
        self.icon.image = image
    }
}
