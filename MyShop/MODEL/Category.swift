//
//  Category.swift
//  MyShop
//
//  Created by fred on 20/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import Foundation
import Firebase

struct CategoryDB: Identifiable {
    public var id: String = UUID().uuidString
    
     var name: String
}
