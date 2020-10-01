//
//  HomeViewController.swift
//  MyShop
//
//  Created by fred on 24/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private(set) var Promo = [Item]()
    
    @IBOutlet var HeaderView: HeaderView!
    @IBOutlet var HomeItemLeftView: UIView!
    @IBOutlet var HomeItemRightView: UIView!
    @IBOutlet var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promoHomeItems()
        addShadow()
    }
    
    func promoHomeItems() {
        for pastry in ItemsService.shared.pastries {
            if pastry.promo == true {
               Promo.append(pastry)
           }
       }
        HeaderView.HomeItemLeftName.text = Promo[0].nom
        HeaderView.HomeItemLeftAuthor.text = Promo[0].auteur
        HeaderView.HomeItemLeftImage.image = UIImage(named: Promo[0].photo)
        HeaderView.HomeItemLeftDescription.text = Promo[0].description
        
        HeaderView.HomeItemRightName.text = Promo[1].nom
        HeaderView.HomeItemRightAuthor.text = Promo[1].auteur
        HeaderView.HomeItemRightImage.image = UIImage(named: Promo[1].photo)
        HeaderView.HomeItemRightDescription.text = Promo[1].description
        
        HeaderView.InfoPromo.text = "Profitez de la livraison gratuite  de 50 €"
   }
    
    private func addShadow() {
        HomeItemLeftView.layer.shadowColor = UIColor.systemPink.cgColor
        HomeItemLeftView.layer.shadowRadius = 2.0
        HomeItemLeftView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        HomeItemLeftView.layer.shadowOpacity = 0.7
        
        HomeItemRightView.layer.shadowColor = UIColor.systemPink.cgColor
        HomeItemRightView.layer.shadowRadius = 2.0
        HomeItemRightView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        HomeItemRightView.layer.shadowOpacity = 0.7
    }
    
    
    // button to show AllCategoriesViewController
    @IBAction func toutVoirButton(_ sender: UIButton) {
    }
    
    

}

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
        let itemsCollection = self.storyboard?.instantiateViewController(withIdentifier: "itemsCollection") as! ItemsViewController
        self.navigationController?.pushViewController(itemsCollection, animated: true)
    }
}
