//
//  HomeViewController.swift
//  MyShop
//
//  Created by fred on 24/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var infoPromo = "Profitez de la livraison gratuite dès 50 € d'achats"
    
    @IBOutlet var HeaderView: HeaderView!
    @IBOutlet var HomeItemLeftView: UIView!
    @IBOutlet var HomeItemRightView: UIView!
    @IBOutlet var HomeTableView: UITableView!
    
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promoHomeItems()
        addShadow(adhocView: HomeItemLeftView)
        addShadow(adhocView: HomeItemRightView)
        homeLeftViewTapGesture()
        homeRightViewTapGesture()
    }

// MARK: - Select item for ItemsView and give them value

    func promoHomeItems() {
        ItemsService.shared.AddPromo()
        let itemPromo = ItemsService.shared.Promo
        
        HeaderView.HomeItemLeftName.text = itemPromo[0].nom
        HeaderView.HomeItemLeftAuthor.text = itemPromo[0].auteur
        HeaderView.HomeItemLeftImage.image = UIImage(named: itemPromo[0].photo)
        HeaderView.HomeItemLeftDescription.text = itemPromo[0].description

        HeaderView.HomeItemRightName.text = itemPromo[1].nom
        HeaderView.HomeItemRightAuthor.text = itemPromo[1].auteur
        HeaderView.HomeItemRightImage.image = UIImage(named: itemPromo[1].photo)
        HeaderView.HomeItemRightDescription.text = itemPromo[1].description

        HeaderView.InfoPromo.text = infoPromo
    }
    
// MARK: - Shadow

        private func addShadow(adhocView: UIView) {
            adhocView.layer.shadowColor = UIColor.systemPink.cgColor
            adhocView.layer.shadowRadius = 2.0
            adhocView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            adhocView.layer.shadowOpacity = 0.7
        }

// MARK: - TapGesture HomeItemsView

    func homeLeftViewTapGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(leftHandleTap(_:)))
        HomeItemLeftView.addGestureRecognizer(tapGesture)
    }

    @objc func leftHandleTap(_ sender: UITapGestureRecognizer) {
        if HomeItemLeftView.backgroundColor == UIColor.white {
            HomeItemLeftView.backgroundColor = UIColor.systemGray5
            
            let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
            let itemSelected = ItemsService.shared.Promo[0]
            itemTable.itemSelected = itemSelected
            self.navigationController?.pushViewController(itemTable, animated: true)
            print("geste reconnu")
        } else {
            HomeItemLeftView.backgroundColor = UIColor.white
        }
    }

    func homeRightViewTapGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(rightHandleTap(_:)))
        HomeItemRightView.addGestureRecognizer(tapGesture)
    }

    @objc func rightHandleTap(_ sender: UITapGestureRecognizer) {
        if HomeItemRightView.backgroundColor == UIColor.white {
            HomeItemRightView.backgroundColor = UIColor.systemGray5
            let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
            let itemSelected = ItemsService.shared.Promo[1]
            itemTable.itemSelected = itemSelected
            self.navigationController?.pushViewController(itemTable, animated: true)
            
        } else {
            HomeItemRightView.backgroundColor = UIColor.white
        }
    }

// MARK: - Button to show AllCategoriesViewController

    @IBAction func toutVoirButton(_ sender: UIButton) {
        let categoriesTable = self.storyboard?.instantiateViewController(identifier: "CategoriesTable") as! AllCategoriesViewController
        
        self.navigationController?.pushViewController(categoriesTable, animated: true)
    }
}

// MARK: - Extensions

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        //return ItemsService.shared.AllCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = HomeTableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }
        let item = ItemsService.shared.AllCategories[indexPath.row]
        cell.categoryLabel.text = item

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemsCollection = self.storyboard?.instantiateViewController(withIdentifier: "collectionView") as! ItemsCollectionViewController
        let categoryName = ItemsService.shared.AllCategories[indexPath.row]
        itemsCollection.itemsCategory = categoryName
        self.navigationController?.pushViewController(itemsCollection, animated: true)
        
    }
}
