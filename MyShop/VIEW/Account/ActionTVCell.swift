//
//  ActiveTVCell.swift
//  MyShop
//
//  Created by fred on 26/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ActionTVCell: UITableViewCell {
    
    @IBOutlet var connectState: UIView!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var connectView: UIView!
    @IBOutlet var connexionBt: UIButton! 

    var stateButton: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        connectView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func signButton(sender: UIButton) {
        if let signButton = self.stateButton  {
            signButton()
            
        }
    }

}
