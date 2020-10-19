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
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        // on crée le constructeur avec keypath, qui est le mot clé pour aller chercher une animation particuliére
        pulse.duration = 0.6
        pulse.fromValue = 0.25 // % de variation de la taille du bouton
        pulse.toValue = 1
        pulse.autoreverses = false // bouton va rétrécir puis revenir
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0

        layer.add(pulse, forKey: nil)
    }
}
