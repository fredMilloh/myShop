//
//  ItemsViewController.swift
//  MyShop
//
//  Created by fred on 30/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    private(set) var Categories = [Item]()

    // var to collect cell category name from tableView
    var itemsCategory = ""

    @IBOutlet var CollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        selectItemsCategory()
    }

//Marks: - sort items by category

    func selectItemsCategory() {

        for pastry in ItemsService.shared.pastries {
            if pastry.categorie == itemsCategory {
               Categories.append(pastry)
           }
       }
    }
}

//Marks: - extensions

extension ItemsViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "itemsCollectionCell", for: indexPath) as? ItemsCollectionViewCell else { return UICollectionViewCell() }
        let item = Categories[indexPath.row]

        cell.ItemsCollectionName.text = item.nom
        cell.ItemsCollectionAuthor.text = item.auteur
        cell.ItemsCollectionDescription.text = item.description
        cell.ItemsCollectionImage.image = UIImage(named: item.photo)
        return cell
    }
}
/*
extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180.00, height: 175.00)
    }
}
*/
