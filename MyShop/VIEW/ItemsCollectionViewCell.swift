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
    @IBOutlet var ItemsCollectionAddedView: UIView!
    
    var addButtonPressed: (() -> Void)? = nil
    var whishButtonPressed: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ItemsCollectionView.addShadow()
    }
    
// MARK: - Button Pressed
    
    @IBAction func whishButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        if let whishButtonPressed = self.whishButtonPressed {
            whishButtonPressed()
        }
    }
    
    @IBAction func addBasketButton(sender: UIButton) {
        if let addButtonPressed = self.addButtonPressed  {
            addButtonPressed()
            addedBasketAnimOn()
            addedBasketAnimEnd()
        }
    }
 
// MARK: - Animations View
    
    func addedBasketAnimOn() {
        self.ItemsCollectionAddedView.transform = .identity
        ItemsCollectionAddedView.addShadow()
        self.ItemsCollectionName.alpha = 0
        self.ItemsCollectionAuthor.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 0.05, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            let moveUpTransform = CGAffineTransform(translationX: 0, y: -40)
            self.ItemsCollectionAddedView.transform = moveUpTransform
            self.ItemsCollectionAddedView.alpha = 1.0
        }, completion: nil)
    }
    
    func addedBasketAnimEnd() {
        UIView.animate(withDuration: 2.0, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: [], animations: {
            self.ItemsCollectionAddedView.alpha = 0.0
            let scaleDownTransform = CGAffineTransform.init(scaleX: -1, y: 1)
            let moveBottomTransform = CGAffineTransform.init(translationX: 300, y: 300)
            let scaleMoveTransform = scaleDownTransform.concatenating(moveBottomTransform)
            self.ItemsCollectionAddedView.transform = scaleMoveTransform
            self.ItemsCollectionName.alpha = 1
            self.ItemsCollectionAuthor.alpha = 1
        }, completion: nil)
        
    }

}
