//
//  UIButtonExtension.swift
//  MyShop
//
//  Created by fred on 10/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

extension UIButton {
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 1.0
        flash.fromValue = 1
        flash.toValue = 0.0
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut) //ralenti l'animation au début et/ou à la fin
        flash.autoreverses = true // effet oscillant
        flash.repeatCount = 1

        layer.add(flash, forKey: nil)
    }
}
