//
//  Items.swift
//  MyShop
//
//  Created by fred on 27/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import Foundation

struct Items {
    
    var items: [(Item)]
}

struct Item {
    var auteur: String
    var nom: String
    var categorie: String
    var prix: Double
    var montant: Double
    var description: String
    var allergens: String
    var photo: String
    var siteWeb: String
    var promo: Bool
}
