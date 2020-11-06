//
//  SearchResultTVController.swift
//  MyShop
//
//  Created by fred on 18/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class SearchResultTVController: UITableViewController {
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func searchBar () {
        searchController = UISearchController(searchResultsController: nil)
            //1-pour placer la recherche dans barre de navigation (apparait après slide vers le bas)
        //1-self .navigationItem.searchController = searchController
            //2-pour place la recherche en entete de la table
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        // personnalisation de la serachBar
        searchController.searchBar.placeholder = "rechercher une patisserie ou un créateur ...."
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.tintColor = .systemPink //couleur curseur
        searchController.searchBar.searchTextField.textColor = .systemPink //couleur text
        searchController.searchBar.searchTextField.backgroundColor = .white
        
    }
    func filterContent(for searchText: String) {
        ItemsService.shared.searchResults = ItemsService.shared.pastries.filter({ (item) -> Bool in
            let nom = item.nom
            let auteur = item.auteur
            let isMatch = nom.localizedCaseInsensitiveContains(searchText) || auteur.localizedCaseInsensitiveContains(searchText)
            return isMatch
        })
    }
    
// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive { return ItemsService.shared.searchResults.count }
        else { return ItemsService.shared.pastries.count }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? WhishListTableViewCell else { return UITableViewCell() }
        let item = (searchController.isActive) ? ItemsService.shared.searchResults[indexPath.row] : ItemsService.shared.pastries[indexPath.row]
        
        cell.whishlistName.text = item.nom
        cell.whishlistAuthor.text = item.auteur
        cell.whishlistPrice.text = String(format: "%.2f", (item.prix)) + "€"
        cell.whishlistImage.image = UIImage(named: item.photo)
        cell.addPressed = { ItemsService.shared.addBasket(item: item) }
        return cell
    }
// MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
        let itemSelected = (searchController.isActive) ? ItemsService.shared.searchResults[indexPath.row] : ItemsService.shared.pastries[indexPath.row]
        itemTable.itemSelected = itemSelected
        self.navigationController?.pushViewController(itemTable, animated: true)
        searchController.dismiss(animated: true)
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

}

extension SearchResultTVController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
}

