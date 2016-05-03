//
//  CustomCell.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/19/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var roomButton: UIButton!
    @IBOutlet weak var reservedButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
