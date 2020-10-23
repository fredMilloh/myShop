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
    
    func anchors(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, topConstant: CGFloat, leftConstant: CGFloat, bottomConstant: CGFloat, rightConstant: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // on rend optionnel les valeures pour ne pas les rendre obligatoires car certains objets n'ont pas besoin de toutes les contraintes, il faut donc les déballées
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: rightConstant).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    // pour ne pas avoir rgb(red:....) on ajout underscore rgb(_ red:...)
}


