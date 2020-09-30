//
//  AllCategoriesViewController.swift
//  MyShop
//
//  Created by fred on 29/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class AllCategoriesViewController: UIViewController {
    
    @IBOutlet weak var AllCategoriesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension AllCategoriesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemsService.shared.AllCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = AllCategoriesTableView.dequeueReusableCell(withIdentifier: "allCategoriesCell", for: indexPath) as? AllCategoriesCell else { return UITableViewCell() }
        let item = ItemsService.shared.AllCategories[indexPath.row]
        cell.allCategoryLabel.text = item
        
            return cell
    }
}
extension AllCategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemsCollection = self.storyboard?.instantiateViewController(withIdentifier: "itemsCollection") as! ItemsViewController
        self.navigationController?.pushViewController(itemsCollection, animated: true)
    }
}
