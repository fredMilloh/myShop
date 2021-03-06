//
//  ItemsService.swift
//  MyShop
//
//  Created by fred on 27/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ItemsService {

    static let shared = ItemsService()
    private init() {}
    
    var addPanierIcon: String {
        return "panierIcon"
    }
    
    private var db = Firestore.firestore()
    
    func fetchCategories() {
        db.collection("categories").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else { print("NoDoc")
                return }
            self.AllCategoriesDB = documents.map({ (queryDocumentSnapshot) -> CategoryDB in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                
                return CategoryDB(name: name)
            })
        }
    }
    private(set) var AllCategories = ["Biscuit", "Cake", "Chocolat", "Choux", "Entremet", "Individuel", "Tartelettes", "Tartes"]
    
    var AllCategoriesDB = [CategoryDB]()
    
    func addBasket(item: Item) {
        for var pastry in pastries {
            if item.nom == pastry.nom {
                if pastry.quantite == 0 {
                    pastry.quantite += 1
                    pastry.cart = true
                    BasketItems.append(pastry)
                    print(pastry)
                }
            }
        }
    }
    
    var CategoriesItems = [Item]()
    
    var BasketItems = [Item]()
    
    var BasketMontant = 0.00
    
    var WhishListItems = [Item]()
    
    var Promo = [Item]()
    
    func AddPromo() {
        for pastry in pastries {
            if pastry.promo == true {
                Promo.append(pastry)
           }
       }
    }
    
    var searchResults = [Item]()

    var pastries = [
        Item(auteur: "Cédric Grolet", nom: "Fleur Coco Noir", categorie: "Biscuit", prix: 15.00, quantite: 0, montant: 15.00, description: "Praliné coco, gel coco avec fine coque de chocolat non conché Alain Ducasse", allergens: "Fruits à coque, Lactose", photo: "FleurCocoNoir", siteWeb: "https://cedric-grolet.com/meurice/produit/fleur-coco-noir/", promo: false, cart: false),
        Item(auteur: "Carl Marletti", nom: "Le Lily Valley", categorie: "Choux", prix: 6.40, quantite: 0, montant: 6.40, description: "Pâte feuilletée, petits choux... comme un Saint-Honoré à la violette", allergens: "fruits à coques, gluten, lait, sulfites, œufs", photo: "LilyValley", siteWeb: "https://www.carlmarletti.com/patisseries/", promo: false, cart: false),
        Item(auteur: "Carl Marletti", nom: "Le Carioca", categorie: "Individuel", prix: 6.60, quantite: 0, montant: 6.60, description: "Sablé noix de coco, crémeux café et coeur praliné cacahuète, émulsion de lait de coco au citron vert", allergens: "arachides, fruits à coques, gélatine de poisson, gluten, lait, sulfites, œufs", photo: "Carioca", siteWeb: "https://www.carlmarletti.com/patisseries/", promo: true, cart: false),
        Item(auteur: "Sadaharu Aoki", nom: "Eclair mâcha", categorie: "Individuel", prix: 7.00, quantite: 0, montant: 7.00, description: "Pâte à choux à la crème pâtissière au thé vert", allergens: "blé, lait, oeuf, soja, sulfites, poisson", photo: "EclairMacha", siteWeb: "http://www.sadaharuaoki.com/catalogue/catalogue-fr.html", promo: false, cart: false),
        Item(auteur: "Jacques Genin", nom: "Chocolats", categorie: "Chocolat", prix: 23.00, quantite: 0, montant: 23.00, description: "larges choix de bonbons de chocolats", allergens: "en fonction de la garniture", photo: "Chocolats", siteWeb: "https://jacquesgenin.fr/fr/jacques-genin/", promo: false, cart: false),
        Item(auteur: "Nicolas Stohrer", nom: "Baba au rhum", categorie: "Individuel", prix: 5.40, quantite: 0, montant: 5.40, description: "Pâte à baba imbibée dans un sirop rhumé et chantilly vanille", allergens: "Blé, oeuf, lactose", photo: "Baba", siteWeb: "https://stohrer.fr", promo: false, cart: false),
        Item(auteur: "Nicolas Stohrer", nom: "Tartelette au citron", categorie: "Tartelette", prix: 6.00, quantite: 0, montant: 6.00 , description: "Pâte sablée, confit de citron jaune vanillé, crémeux citron vert, crème onctueuse au citron yuzu", allergens: "Blé, Oeuf, Crème", photo: "TarteletteCitron", siteWeb: "https://stohrer.fr", promo: false, cart: false),
        Item(auteur: "Cyril Lignac", nom: "Royal chocolat 4 pers.", categorie: "Entremet", prix: 28.00, quantite: 0, montant: 28.00, description: "Dacquoise aux amandes, feuillantine pralinée, mousse chocolat, feuille craquante de chocolat noir, confit de praliné et glaçage chocolat", allergens: "Blé, fruits à coque, oeuf", photo: "Royal", siteWeb: "https://www.gourmand-croquant.com/fr/", promo: false, cart: false),
        Item(auteur: "Yann Couvreur", nom: "Cake framboises estragon 500 gr", categorie: "Cake", prix: 22.00, quantite: 0, montant: 22.00, description: "Cake moelleux à l'estragon avec des morceaux de framboises légèrement imbibé d'un jus de citron, glaçage citron", allergens: "gluten, lait, oeuf", photo: "CakeFramboises", siteWeb: "https://yanncouvreur.com", promo: false, cart: false),
        Item(auteur: "Pierre Hermé", nom: "Ispahan", categorie: "Entremet", prix: 38.00, quantite: 0, montant: 38.00, description: "Biscuit macaron à la rose, crème aux pétales de roses, framboises et letchis", allergens: "arachides, céleri, lait, lupin, oeuf, gluten", photo: "Ispahan", siteWeb: "https://www.pierreherme.com", promo: true, cart: false),
        Item(auteur: "Angelina", nom: "Mont-blanc", categorie: "Individuel", prix: 12.00, quantite: 0, montant: 12.00, description: "Sa recette, créée au début du XXe siècle par les pâtissiers Angelina, est la même depuis sa création : une meringue française, sèche et croquante, sous un dôme onctueux de Chantilly, recouvert de vermicelles de pâte de marrons.", allergens: "Lait, oeuf", photo: "MontBlanc", siteWeb: "https://www.angelina-paris.fr", promo: false, cart: false),
        Item(auteur: "Cédric Grolet", nom: "Pomme Gala", categorie: "Tartelette", prix: 15.00, quantite: 0, montant: 15.00, description: "Tartelette trompe l'oeil pomme Gala rouge écarlate", allergens: "Gluten, oeuf", photo: "PommeGala", siteWeb: "https://cedric-grolet.com/meurice/produit/", promo: false, cart: false),
        Item(auteur: "Sébastien Gaudard", nom: "mini cake", categorie: "Cake", prix: 5.00, quantite: 0, montant: 5.00, description: "Gâteaux de haut-vol entre recettes familiales et créations originales", allergens: "gluten, oeuf", photo: "MiniCake", siteWeb: "www.sebastiengaudard.com", promo: false, cart: false),
        Item(auteur: "Bontemps", nom: "Tarte aux Fruits", categorie: "Tartes", prix: 37.00, quantite: 0, montant: 37.00, description: "Meilleures tartes aux fruits de Paris", allergens: "Gluten, Oeuf, Lait", photo: "TartesFruits", siteWeb: "", promo: false, cart: false),
        Item(auteur: "Yann Couvreur", nom: "Millefeuille", categorie: "Individuel", prix: 8.00, quantite: 0, montant: 8.00, description: "Gâteau signature à la vanille des Comores", allergens: "Gluten, oeuf, lait", photo: "Millefeuille", siteWeb: "www.yanncouvreur.com", promo: false, cart: false),
        Item(auteur: "Sadaharu Aoki", nom: "Tarte caramel matcha", categorie: "Tartes", prix: 43.00, quantite: 0, montant: 43.00, description: "tarte au caramel et thé matcha", allergens: "gluten, lait, oeuf", photo: "TarteCaramelMatcha", siteWeb: "http://www.sadaharuaoki.com/catalogue/catalogue-fr.html", promo: false, cart: false),
        Item(auteur: "Philippe Conticini", nom: "Tarte à l'ananas roti", categorie: "Tartes", prix: 48.50, quantite: 0, montant: 48.50, description: "Pâte sucréé, biscuit ultra fondant à la noix de coco, crème à la passion, ananas confits et éclats de caramel", allergens: "gluten, oeuf, lait", photo: "TarteAnanas", siteWeb: "www.philippeconticini.fr", promo: false, cart: false),
        Item(auteur: "Tomo", nom: "Dorayaki", categorie: "Individuel", prix: 14.50, quantite: 0, montant: 14.50, description: "Sorte de pancake garni de pâte de haricots rouges", allergens: "gluten, oeuf", photo: "Dorayaki", siteWeb: "www.patisserietomo.fr", promo: false, cart: false),
        Item(auteur: "Jacques Génin", nom: "Paris Brest", categorie: "Individuel", prix: 9.00, quantite: 0, montant: 9.00, description: "Pâte à choux garni de crème mousseline au praliné", allergens: "gluten, oeuf, lait, fruits à coque", photo: "ParisBrest", siteWeb: "www.jacquesgenin.fr", promo: false, cart: false)]
}
