//
//  RoundedTextField.swift
//  MyShop
//
//  Created by fred on 27/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField { // on crée un class fille(sous classe) à la classe UITextField pour appliquer de nouvelles propriétés
    // PENSER à attribuer cette nouvelle class à chaque champs dans le storyboard

    // détermine un espace entre le début du texte et le bord du champs
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    // on applique cet espace au rectangle
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // on applique cet espace au début du placeholder
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // on applique cet espace au début de la frappe du nouveau texte
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // pour arrondir les angles du champs
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}
