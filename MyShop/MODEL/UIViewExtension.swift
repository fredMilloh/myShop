//
//  UIViewExtension.swift
//  MyShop
//
//  Created by fred on 17/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

extension UIView {
     func addShadow() {
        layer.shadowColor = UIColor.systemPink.cgColor
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowOpacity = 0.7
    }
}
