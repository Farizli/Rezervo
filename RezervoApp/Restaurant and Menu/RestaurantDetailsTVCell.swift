//
//  RestaurantDetailsTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 14.04.23.
//

import UIKit

class RestaurantDetailsTVCell: UITableViewCell {

    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title: String, body: String) {
        self.title.text = title
        self.body.text = body
    }

}
