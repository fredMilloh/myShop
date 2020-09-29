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
    
    private(set) var pastry = [Item(auteur: "Cédric Grolet", nom: "Fleur Coco Noir", categorie: "Chocolat", prix: "15 €", description: "Praliné coco, gel coco avec fine coque de chocolat non conché Alain Ducasse", allergens: "Fruits à coque, Lactose", photo: "FleurCocoNoir", siteWeb: "https://cedric-grolet.com/meurice/produit/fleur-coco-noir/"), Item(auteur: "Carl Marletti", nom: "Le Lily Valley", categorie: "Choux", prix: "6,4 €", description: "Pâte feuilletée, petits choux... comme un Saint-Honoré à la violette", allergens: "fruits à coques, gluten, lait, sulfites, œufs", photo: "LilyValley", siteWeb: "https://www.carlmarletti.com/patisseries/"), Item(auteur: "Carl Marletti", nom: "Le Carioca", categorie: "Crémeux", prix: "6,60 €", description: "Sablé noix de coco, crémeux café et coeur praliné cacahuète, émulsion de lait de coco au citron vert", allergens: "arachides, fruits à coques, gélatine de poisson, gluten, lait, sulfites, œufs", photo: "Carioca", siteWeb: "https://www.carlmarletti.com/patisseries/"), Item(auteur: "Sadaharu Aoki", nom: "Eclair mâcha", categorie: "Eclairs", prix: "0,00 €", description: "Pâte à choux à la crème pâtissière au thé vert", allergens: "blé, lait, oeuf, soja, sulfites, poisson", photo: "EclairMacha", siteWeb: "http://www.sadaharuaoki.com/catalogue/catalogue-fr.html"), Item(auteur: "Jacques Genin", nom: "Chocolats", categorie: "Bonbons", prix: "0,00 €", description: "larges choix de bonbons de chocolats", allergens: "en fonction de la garniture", photo: "Chocolat", siteWeb: "https://jacquesgenin.fr/fr/jacques-genin/"), Item(auteur: "Nicolas Stohrer", nom: "Baba au rhum", categorie: "Baba", prix: "0,00 €", description: "Pâte à baba imbibée dans un sirop rhumé et chantilly vanille", allergens: "Blé, oeuf, lactose", photo: "Baba", siteWeb: "https://stohrer.fr"), Item(auteur: "Nicolas Stohrer", nom: "Tartelette au citron", categorie: "Tartelette", prix: "0,00 €", description: "Pâte sablée, confit de citron jaune vanillé, crémeux citron vert, crème onctueuse au citron yuzu", allergens: "Blé, Oeuf, Crème", photo: "TarteletteCitron", siteWeb: "https://stohrer.fr"), Item(auteur: "Cyril Lignac", nom: "Royal chocolat 4 pers.", categorie: "Gâteau", prix: "28,00 €", description: "Dacquoise aux amandes, feuillantine pralinée, mousse chocolat, feuille craquante de chocolat noir, confit de praliné et glaçage chocolat", allergens: "Blé, fruits à coque, oeuf", photo: "Royal", siteWeb: "https://www.gourmand-croquant.com/fr/")]
}
