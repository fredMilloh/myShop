//
//  RecapTVCell.swift
//  MyShop
//
//  Created by fred on 02/11/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class RecapTVCell: UITableViewCell {
    
    @IBOutlet var recapView: UIView!
    @IBOutlet var montantPanier: UILabel!
    @IBOutlet var fraisLivraison: UILabel!
    @IBOutlet var tva: UILabel!
    @IBOutlet var totalAPayer: UILabel!
    
    var button: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func payerPressed(sender: UIButton) {
        if let payerPressed = self.button  {
           payerPressed()
            
        }
    }

}
