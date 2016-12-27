//
//  CustomCell.swift
//  quickneasy
//
//  Created by Lesly Garcia on 12/27/16.
//  Copyright © 2016 LEA. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var photo: UIImageView!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
