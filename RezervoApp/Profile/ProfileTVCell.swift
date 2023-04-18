//
//  ProfileTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit

class ProfileTVCell: UITableViewCell {

    @IBOutlet weak var dashLine: UIImageView!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(hasDashline: Bool, title: String, icon: UIImage, hasSwitch: Bool) {
        self.dashLine.isHidden = !hasDashline
        self.mainTitle.text = title
        self.icon.image = icon
        self.switch.isHidden = !hasSwitch
    }
}
