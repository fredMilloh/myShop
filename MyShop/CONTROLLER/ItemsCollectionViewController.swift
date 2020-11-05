//
//  ItemsCollectionViewController.swift
//  MyShop
//
//  Created by fred on 07/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ItemsCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "ItemCell"
    
    private let sectionInsets = UIEdgeInsets(top: 35.0, left: 10.0, bottom: 50.0, right: 10.0)
    private let itemsPerRow: CGFloat = 2 // nb par ligne

    // var to collect cell category name from tableView
    var itemsCategory = ""
    
    private var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectItemsCategory()

        // Register cell classes - desactive sinon plante
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

// MARK: - Sort items by category
    /* // test pour fetch items from Firebase
    func fetchItemsByCategoriy() {
        
        db.collection("categories/biscuit/biscuits").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else { print("NoDoc")
                return }
            ItemsService.shared.CategoriesItems = documents.map({ (queryDocumentSnapshot) -> Item in
                let data = queryDocumentSnapshot.data()
                
                let nom = data["nom"] as? String ?? ""
                let auteur = data["auteur"] as? String ?? ""
                let prix = data["prix"] as? Double ?? 0.00
                let montant = data["montant"] as? Double ?? 0.00
                let description = data["description"] as? String ?? ""
                let allergens = data["allergens"] as? String ?? ""
                let siteWeb = data["siteWeb"] as? String ?? ""
                
                
                
                return Item(auteur: auteur, nom: nom, categorie: "", prix: prix, montant: montant, description: description, allergens: allergens, photo: "", siteWeb: siteWeb, promo: false)
            })
            print(ItemsService.shared.CategoriesItems)
        }
    }
 */
        
        func selectItemsCategory() {
            ItemsService.shared.CategoriesItems = [Item]() //remise a zéro pour ne pas cumuler les catégories
            for pastry in ItemsService.shared.pastries {
                if pastry.categorie == itemsCategory {
                    ItemsService.shared.CategoriesItems.append(pastry)
               }
           }
        }
        

// MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemsService.shared.CategoriesItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ItemsCollectionViewCell else { return UICollectionViewCell() }
        
        let item = ItemsService.shared.CategoriesItems[indexPath.row]
       
        cell.ItemsCollectionAuthor.text = item.auteur
        cell.ItemsCollectionDescription.text = item.description
        cell.ItemsCollectionImage.image = UIImage(named: item.photo)
        cell.ItemsCollectionName.text = item.nom
        cell.addButtonPressed = { ItemsService.shared.addBasket(item: item) }
        cell.whishButtonPressed = { ItemsService.shared.WhishListItems.append(item) }
        return cell
    }
    
// MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
        let itemSelected = ItemsService.shared.CategoriesItems[indexPath.row]
        itemTable.itemSelected = itemSelected
        self.navigationController?.pushViewController(itemTable, animated: true)
        
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    }
    */
}
extension ItemsCollectionViewController: UICollectionViewDelegateFlowLayout {
        
        // pour définir la taille et la disposition d'une cell
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
        // espace entre cell, headers et footer avec la constante sectionInsets
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
        // espacement entre chaque ligne
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
    }
