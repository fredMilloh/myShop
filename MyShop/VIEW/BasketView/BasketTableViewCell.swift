//
//  BasketTableViewCell.swift
//  MyShop
//
//  Created by fred on 09/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    
    @IBOutlet var itemBasketView: UIView!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var plusButtonPressed: (() -> Void)? = nil
    var minusButtonPressed: (() -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func plusBasketButton(sender: UIButton) {
        if let plusButtonPressed = self.plusButtonPressed  {
            plusButtonPressed()
        
    }
    }
        
    @IBAction func minusBasketButton(sender: UIButton) {
        if let minusButtonPressed = self.minusButtonPressed  {
            minusButtonPressed()
    }
    }

}
