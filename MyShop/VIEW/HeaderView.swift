//
//  HeaderView.swift
//  MyShop
//
//  Created by fred on 26/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    @IBOutlet var searchTextField: UITextField!
    
    //leftViewItem
    @IBOutlet var HomeItemLeftView: UIView!
    @IBOutlet var HomeItemLeftImage: UIImageView!
    @IBOutlet var HomeItemLeftName: UILabel!
    @IBOutlet var HomeItemLeftAuthor: UILabel!
    @IBOutlet var HomeItemLeftDescription: UILabel!
    //rightViewItem
    @IBOutlet var HomeItemRightView: UIView!
    @IBOutlet var HomeItemRightImage: UIImageView!
    @IBOutlet var HomeItemRightName: UILabel!
    @IBOutlet var HomeItemRightAuthor: UILabel!
    @IBOutlet var HomeItemRightDescription: UILabel!
    
    @IBOutlet var InfoPromo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
     func addShadow() {
        HomeItemLeftView.layer.shadowColor = UIColor.systemPink.cgColor
        HomeItemLeftView.layer.shadowRadius = 2.0
        HomeItemLeftView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        HomeItemLeftView.layer.shadowOpacity = 2.0
    }
    
    
}
