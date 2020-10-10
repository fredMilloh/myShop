//
//  ItemTableViewCell.swift
//  MyShop
//
//  Created by fred on 08/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet  var itemTableView: UIView!
    @IBOutlet var itemTableName: UILabel!
    @IBOutlet var itemTableAuthor: UILabel!
    @IBOutlet var itemTablePrice: UILabel!
    @IBOutlet var itemTableNote: UILabel!
    @IBOutlet var itemTableDescription: UILabel!
    @IBOutlet var itemTableAllergens: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
