//
//  WhishListTableViewCell.swift
//  MyShop
//
//  Created by fred on 16/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class WhishListTableViewCell: UITableViewCell {
    
    @IBOutlet var whishlistCellView: UIView!
    @IBOutlet var whishlistName: UILabel!
    @IBOutlet var whishlistAuthor: UILabel!
    @IBOutlet var whishlistPrice: UILabel!
    @IBOutlet var whishlistImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        whishlistCellView.addShadow()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
