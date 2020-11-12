//
//  HomeViewController.swift
//  MyShop
//
//  Created by fred on 24/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var infoPromo = "Profitez de la livraison gratuite dès 70 € d'achats"
    var infoPromoImage2: String { return "EspacePub4"}
    
    @IBOutlet var HeaderView: HeaderView!
    @IBOutlet var HomeItemLeftView: UIView!
    @IBOutlet var HomeItemRightView: UIView!
    @IBOutlet var HomeTableView: UITableView!
    @IBOutlet var FooterView: FooterView!
    
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTableView.reloadData()
        ItemsService.shared.fetchCategories()
        promoHomeItems()
        
        homeLeftViewTapGesture()
        homeRightViewTapGesture()
        animPromoView()
        animEspacePubView()
        
        print("view did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        HomeTableView.reloadData()
        ItemsService.shared.fetchCategories()
        animPromoView()
        animEspacePubView()
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        let resultsController = self.storyboard?.instantiateViewController(identifier: "SearchResult") as! SearchResultTVController
        
        self.navigationController?.pushViewController(resultsController, animated: true)
        
    }
    
// MARK: - Select item for ItemsView and give them value

    func promoHomeItems() {
        ItemsService.shared.AddPromo()
        let itemPromo = ItemsService.shared.Promo

        HeaderView.HomeItemLeftName.text = itemPromo[0].nom
        HeaderView.HomeItemLeftAuthor.text = itemPromo[0].auteur
        HeaderView.HomeItemLeftImage.image = UIImage(named: itemPromo[0].photo)
        HomeItemLeftView.addShadow()

        HeaderView.HomeItemRightName.text = itemPromo[1].nom
        HeaderView.HomeItemRightAuthor.text = itemPromo[1].auteur
        HeaderView.HomeItemRightImage.image = UIImage(named: itemPromo[1].photo)
        HomeItemRightView.addShadow()
        
        HeaderView.InfoPromo.text = infoPromo
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
    
// MARK: - Animation Footer
    
    func animPromoView() {
        
        let secondImageView = UIImageView(image: UIImage(named: "EspacePub4"))
        secondImageView.clipsToBounds = FooterView.imagePromoImage.clipsToBounds
        secondImageView.alpha = 0.0
        
        FooterView.imagePromoImage.insertSubview(secondImageView, aboveSubview: FooterView.imagePromoImage)
        
        UIView.animate(withDuration: 5.0, delay: 1.0, options: [.repeat] , animations: {
            let rotationX = CGAffineTransform.init(scaleX: 1, y: -1)
                        self.FooterView.imagePromoImage.transform = rotationX
            secondImageView.alpha = 1.0 }, completion: {_ in
            self.FooterView.imagePromoImage.image = secondImageView.image
            secondImageView.removeFromSuperview()
        })
    }
    
    func animEspacePubView() {
        UIView.animate(withDuration: 2, delay: 1.0, options: [.repeat], animations: {
            self.FooterView.espacePubLabel.alpha = 0
        }, completion: nil)
        
    }
}

// MARK: - Extensions

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        //return ItemsService.shared.AllCategoriesDB.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }
        let item = ItemsService.shared.AllCategories[indexPath.row]
        cell.categoryLabel.text = item

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemsCollection = self.storyboard?.instantiateViewController(withIdentifier: "collectionView") as! ItemsCollectionViewController
        let categoryName = ItemsService.shared.AllCategoriesDB[indexPath.row].name
        itemsCollection.itemsCategory = categoryName
        self.navigationController?.pushViewController(itemsCollection, animated: true)
        
    }
}
