//
//  YelpCell.swift
//  Unit1
//
//  Created by Gerdin Ventura on 9/11/21.
//

import UIKit

class YelpCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var reviewCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
