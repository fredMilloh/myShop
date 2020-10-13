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

// MARK: - leftViewItem

    @IBOutlet var HomeItemLeftImage: UIImageView!
    @IBOutlet var HomeItemLeftName: UILabel!
    @IBOutlet var HomeItemLeftAuthor: UILabel!
    @IBOutlet var HomeItemLeftDescription: UILabel!
    
// MARK: - rightViewItem

    @IBOutlet var HomeItemRightImage: UIImageView!
    @IBOutlet var HomeItemRightName: UILabel!
    @IBOutlet var HomeItemRightAuthor: UILabel!
    @IBOutlet var HomeItemRightDescription: UILabel!

    @IBOutlet var InfoPromo: UILabel!

}
