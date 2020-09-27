//
//  ItemsService.swift
//  MyShop
//
//  Created by fred on 27/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import Foundation

class ItemsService {
    
    static let shared = ItemsService()
    private init() {}

    private(set) var item = ["Vétements", "Chaussures", "Bijoux", "Accessoires", "Sous-Vétements", "Meubles", "Cuisine", "Livres", "Musique", "Informatique", "Eléctroménager"]
}
