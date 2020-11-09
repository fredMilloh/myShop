//
//  LabelTVCell.swift
//  MyShop
//
//  Created by fred on 26/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class LabelTVCell: UITableViewCell {
    
    @IBOutlet var labelView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoDetail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        labelView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
