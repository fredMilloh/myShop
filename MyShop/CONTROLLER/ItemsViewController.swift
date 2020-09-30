//
//  ItemsViewController.swift
//  MyShop
//
//  Created by fred on 30/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet var CollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension ItemsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemsService.shared.pastry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "itemsCollectionCell", for: indexPath) as? ItemsCollectionViewCell else { return UICollectionViewCell() }
        let item = ItemsService.shared.pastry[indexPath.row]
        
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
