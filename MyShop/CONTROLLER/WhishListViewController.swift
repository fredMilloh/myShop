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
        panierVide()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        WhishListTableView.reloadData()
        panierVide()
        
    }
    
    func panierVide() {
        if ItemsService.shared.WhishListItems.count == 0 {
        let alert = UIAlertController(title: "Mon panier est vide,", message: "voir les patisseries, miam miam ....", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "j'y vais....", style: .default, handler: { (action) in
            let home = self.storyboard?.instantiateViewController(identifier: "Home") as! HomeViewController
            self.navigationController?.pushViewController(home, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        }
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
        cell.addPressed = {
            ItemsService.shared.BasketItems.append(item)
        }
        return cell
    }
}
extension WhishListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
        let itemSelected = ItemsService.shared.WhishListItems[indexPath.row]
        itemTable.itemSelected = itemSelected
        self.navigationController?.pushViewController(itemTable, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let supprimerAction = UIContextualAction(style: .destructive, title: "supprimer") { (action, sourceView, completionHandler) in
            ItemsService.shared.WhishListItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        let swippeConfiguration = UISwipeActionsConfiguration(actions: [supprimerAction])
        return swippeConfiguration
    }
}
    
