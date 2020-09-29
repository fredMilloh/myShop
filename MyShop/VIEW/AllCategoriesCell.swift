//
//  AllCategoriesCell.swift
//  MyShop
//
//  Created by fred on 29/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class AllCategoriesCell: UITableViewCell {
    
    @IBOutlet var allCategoryLabel: UILabel!
    @IBOutlet var allCategoryView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
