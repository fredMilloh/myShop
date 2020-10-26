//
//  UserInfo.swift
//  MyShop
//
//  Created by fred on 26/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import Foundation

struct User {
    var id: String = UUID().uuidString
    var username: String
    var mail: String
    var imageUrl: String?
    var name: String?
    var prenom: String?
    var adresse1: String?
    var adresse2: String?
    var codePostal: String?
    var ville: String?
    var isConnected: Bool
}

class UserInfo {
    static let shared = UserInfo()
    private init() {}
    
    var userInfo: User!
    var connexion = ""
}
 
