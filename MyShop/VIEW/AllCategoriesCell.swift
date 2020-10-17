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
        allCategoryView.addShadow()
    }
}
