//
//  ItemsCollectionViewCell.swift
//  MyShop
//
//  Created by fred on 30/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var ItemsCollectionView: UIView!
    @IBOutlet var ItemsCollectionImage: UIImageView!
    @IBOutlet var ItemsCollectionName: UILabel!
    @IBOutlet var ItemsCollectionAuthor: UILabel!
    @IBOutlet var ItemsCollectionDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
       addShadow()
    }

    private func addShadow() {
        ItemsCollectionView.layer.shadowColor = UIColor.systemPink.cgColor
        ItemsCollectionView.layer.shadowRadius = 2.0
        ItemsCollectionView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        ItemsCollectionView.layer.shadowOpacity = 0.7
    }
 
}
