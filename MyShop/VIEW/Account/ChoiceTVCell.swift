//
//  ChoiceTVCell.swift
//  MyShop
//
//  Created by fred on 01/11/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ChoiceTVCell: UITableViewCell {
    
    @IBOutlet var choiceState: UIView!
    //@IBOutlet var choiceLabel: UILabel!
    //@IBOutlet var choiceButton: UIButton!
    @IBOutlet var choiceView: UIView!
    
    var button: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        choiceView.addShadow()
        choiceView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        if let buttonPressed = self.button  {
            buttonPressed()
            
        }
    }

}
