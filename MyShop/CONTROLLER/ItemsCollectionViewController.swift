//
//  ItemsCollectionViewController.swift
//  MyShop
//
//  Created by fred on 07/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ItemsCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "ItemCell"
    
    private let sectionInsets = UIEdgeInsets(top: 35.0, left: 10.0, bottom: 50.0, right: 10.0)
    private let itemsPerRow: CGFloat = 2 // nb par ligne

    // var to collect cell category name from tableView
    var itemsCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectItemsCategory()
        

        // Register cell classes - desactice sinon plante
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    
//Marks: - sort items by category

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
        cell.addButtonPressed = {
            ItemsService.shared.BasketItems.append(item)
        }
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
