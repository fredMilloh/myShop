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
    @IBOutlet weak var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promoHomeItems()
        HeaderView.HomeItemLeftName.text = Promo[0].nom
        HeaderView.HomeItemLeftAuthor.text = Promo[0].auteur
        HeaderView.HomeItemLeftImage.image = UIImage(named: Promo[0].photo)
        HeaderView.HomeItemLeftDescription.text = Promo[0].description
        
        HeaderView.HomeItemRightName.text = Promo[1].nom
        HeaderView.HomeItemRightAuthor.text = Promo[1].auteur
        HeaderView.HomeItemRightImage.image = UIImage(named: Promo[1].photo)
        HeaderView.HomeItemRightDescription.text = Promo[1].description
        
    }
    
    func promoHomeItems() {
        for pastry in ItemsService.shared.pastries {
            if pastry.promo == true {
               Promo.append(pastry)
           }
       }
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
        return ItemsService.shared.AllCategories.count
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
