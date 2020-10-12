//
//  ItemTableViewController.swift
//  MyShop
//
//  Created by fred on 08/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    private let reuseIdentifier = "ItemTableCell"
    
    @IBOutlet weak var ItemHeaderView: UIImageView!
    @IBOutlet weak var ItemFooterLabel: UILabel!
    @IBOutlet var addedBasketView: UIView!
    
    //var headerView: ItemHeaderView!
    
    var itemSelected: Item!
    //var itemImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addBasketButtonPressed(_ sender: UIButton) {
        sender.flash()
        
        ItemsService.shared.BasketItems.append(itemSelected)
        addedBasketOn()
        addedBasketOff()
    }
    
    func addedBasketOn() {
        self.addedBasketView.transform = .identity
        UIView.animate(withDuration: 1.0, delay: 0.05, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            let moveUpTransform = CGAffineTransform(translationX: 0, y: -110)
            self.addedBasketView.transform = moveUpTransform
            self.addedBasketView.alpha = 1.0
        }, completion: nil)
    }
    
    func addedBasketOff() {
        UIView.animate(withDuration: 2.0, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options: [], animations: {
            self.addedBasketView.alpha = 0.0
            let scaleDownTransform = CGAffineTransform.init(scaleX: -1, y: 1)
            let moveBottomTransform = CGAffineTransform.init(translationX: 300, y: 300)
            let scaleMoveTransform = scaleDownTransform.concatenating(moveBottomTransform)
            self.addedBasketView.transform = scaleMoveTransform
        }, completion: nil)
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }

        cell.itemTableName.text = itemSelected.nom
        cell.itemTableAuthor.text = itemSelected.auteur
        cell.itemTablePrice.text = itemSelected.prix
        cell.itemTableNote.text = "***** 4.8"
        cell.itemTableDescription.text = itemSelected.description
        cell.itemTableAllergens.text = "Allergènes : " + itemSelected.allergens
        ItemHeaderView.image = UIImage(named: itemSelected.photo)
        ItemFooterLabel.text = itemSelected.siteWeb
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
