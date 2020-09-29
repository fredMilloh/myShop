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
    var categorie: Categories
    var prix: String
    var description: String
    var allergens: String
    var photo: String
    var siteWeb: String
}

enum Categories {
    case Entremet
    case Choux
    case Cake
    case Tartelette
    case Chocolat
    case Eclair
    case Part
    case Biscuit
    case Individuel
    
    
}
