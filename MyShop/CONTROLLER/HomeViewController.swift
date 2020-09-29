//
//  HomeViewController.swift
//  MyShop
//
//  Created by fred on 24/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addCategoryButton(_ sender: UIButton) {
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

