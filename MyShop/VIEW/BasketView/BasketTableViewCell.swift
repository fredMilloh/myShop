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
    @IBOutlet var totalLabel: UILabel!
    
    var plusButtonPressed: (() -> Void)? = nil
    var minusButtonPressed: (() -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow(adhocView: itemBasketView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
// MARK: - Buttons
    
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
    
// MARK: - Shadow

                private func addShadow(adhocView: UIView) {
                    adhocView.layer.shadowColor = UIColor.systemPink.cgColor
                    adhocView.layer.shadowRadius = 2.0
                    adhocView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
                    adhocView.layer.shadowOpacity = 0.7
                }
}
