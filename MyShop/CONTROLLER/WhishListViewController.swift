//
//  WhishListViewController.swift
//  MyShop
//
//  Created by fred on 24/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class WhishListViewController: UIViewController {

    @IBOutlet weak var WhishListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        WhishListTableView.reloadData()
    }

}

// MARK: - Extensions

extension WhishListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemsService.shared.WhishListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = WhishListTableView.dequeueReusableCell(withIdentifier: "WhishListCell", for: indexPath) as? WhishListTableViewCell else { return UITableViewCell() }
        let item = ItemsService.shared.WhishListItems[indexPath.row]
        cell.whishlistAuthor.text = item.auteur
        cell.whishlistImage.image = UIImage(named: item.photo)
        cell.whishlistName.text = item.nom
        cell.whishlistPrice.text = String(format: "%.2f", (item.prix)) + "€"
        return cell
    }
}
extension WhishListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
        let itemSelected = ItemsService.shared.CategoriesItems[indexPath.row]
        itemTable.itemSelected = itemSelected
        self.navigationController?.pushViewController(itemTable, animated: true)
        
    }
}
