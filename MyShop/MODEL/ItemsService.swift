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
    
    private(set) var AllCategories = ["Entremet", "Choux", "Cake", "Tartelette", "Chocolat", "Eclair", "Part", "Biscuit", "Individuel"]
    
    
    private(set) var pastries = [Item(auteur: "Cédric Grolet", nom: "Fleur Coco Noir", categorie: .Chocolat, prix: "15 €", description: "Praliné coco, gel coco avec fine coque de chocolat non conché Alain Ducasse", allergens: "Fruits à coque, Lactose", photo: "FleurCocoNoir", siteWeb: "https://cedric-grolet.com/meurice/produit/fleur-coco-noir/", promo: false), Item(auteur: "Carl Marletti", nom: "Le Lily Valley", categorie: .Choux, prix: "6,4 €", description: "Pâte feuilletée, petits choux... comme un Saint-Honoré à la violette", allergens: "fruits à coques, gluten, lait, sulfites, œufs", photo: "LilyValley", siteWeb: "https://www.carlmarletti.com/patisseries/", promo: false), Item(auteur: "Carl Marletti", nom: "Le Carioca", categorie: .Individuel, prix: "6,60 €", description: "Sablé noix de coco, crémeux café et coeur praliné cacahuète, émulsion de lait de coco au citron vert", allergens: "arachides, fruits à coques, gélatine de poisson, gluten, lait, sulfites, œufs", photo: "Carioca", siteWeb: "https://www.carlmarletti.com/patisseries/", promo: true), Item(auteur: "Sadaharu Aoki", nom: "Eclair mâcha", categorie: .Eclair, prix: "0,00 €", description: "Pâte à choux à la crème pâtissière au thé vert", allergens: "blé, lait, oeuf, soja, sulfites, poisson", photo: "EclairMacha", siteWeb: "http://www.sadaharuaoki.com/catalogue/catalogue-fr.html", promo: false), Item(auteur: "Jacques Genin", nom: "Chocolats", categorie: .Chocolat, prix: "0,00 €", description: "larges choix de bonbons de chocolats", allergens: "en fonction de la garniture", photo: "Chocolats", siteWeb: "https://jacquesgenin.fr/fr/jacques-genin/", promo: false), Item(auteur: "Nicolas Stohrer", nom: "Baba au rhum", categorie: .Individuel, prix: "0,00 €", description: "Pâte à baba imbibée dans un sirop rhumé et chantilly vanille", allergens: "Blé, oeuf, lactose", photo: "Baba", siteWeb: "https://stohrer.fr", promo: false), Item(auteur: "Nicolas Stohrer", nom: "Tartelette au citron", categorie: .Tartelette, prix: "0,00 €", description: "Pâte sablée, confit de citron jaune vanillé, crémeux citron vert, crème onctueuse au citron yuzu", allergens: "Blé, Oeuf, Crème", photo: "TarteletteCitron", siteWeb: "https://stohrer.fr", promo: false), Item(auteur: "Cyril Lignac", nom: "Royal chocolat 4 pers.", categorie: .Entremet, prix: "28,00 €", description: "Dacquoise aux amandes, feuillantine pralinée, mousse chocolat, feuille craquante de chocolat noir, confit de praliné et glaçage chocolat", allergens: "Blé, fruits à coque, oeuf", photo: "Royal", siteWeb: "https://www.gourmand-croquant.com/fr/", promo: false), Item(auteur: "Yann Couvreur", nom: "Cake framboises estragon 500 gr", categorie: .Cake, prix: "22,00 €", description: "Cake moelleux à l'estragon avec des morceaux de framboises légèrement imbibé d'un jus de citron, glaçage citron", allergens: "gluten, lait, oeuf", photo: "CakeFramboises", siteWeb: "https://yanncouvreur.com", promo: false), Item(auteur: "Pierre Hermé", nom: "Ispahan", categorie: .Entremet, prix: "38,00 €", description: "Biscuit macaron à la rose, crème aux pétales de roses, framboises et letchis", allergens: "arachides, céleri, lait, lupin, oeuf, gluten", photo: "Ispahan", siteWeb: "https://www.pierreherme.com", promo: true), Item(auteur: "Angelina", nom: "Mont-blanc", categorie: .Individuel, prix: "0,00 €", description: "Sa recette, créée au début du XXe siècle par les pâtissiers Angelina, est la même depuis sa création : une meringue française, sèche et croquante, sous un dôme onctueux de Chantilly, recouvert de vermicelles de pâte de marrons.", allergens: "Lait, oeuf", photo: "MontBlanc", siteWeb: "https://www.angelina-paris.fr", promo: false)]
    
     
}
