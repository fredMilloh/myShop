//
//  BasketTableViewController.swift
//  MyShop
//
//  Created by fred on 09/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class BasketTableViewController: UITableViewController {
    
    private let reuseIdentifier = "BasketCell"
    var montantTotal: Double = 0.00
    
    @IBOutlet var BasketFooterView: BasketFooter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateTotal()
        BasketFooterView.basketFooterView.addShadow()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
       
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        calculateTotal()
    }
    
    @IBAction func ValidateBasket(_ sender: UIButton) {}
    
// MARK: - Calculate Method
    fileprivate func calculateTotal() {
        montantTotal = 0.00
            for BasketItem in ItemsService.shared.BasketItems {
                montantTotal += BasketItem.montant
            }
        BasketFooterView.montantTotal.text = String(format: "%.2f", self.montantTotal) + "€"
    }

// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ItemsService.shared.BasketItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as? BasketTableViewCell else { return UITableViewCell() }

        let item = ItemsService.shared.BasketItems[indexPath.row]
        cell.authorLabel.text = item.auteur
        cell.nameLabel.text = item.nom
        cell.priceLabel.text = String(format: "%.2f", (item.prix)) + "€"
        cell.quantityLabel.text = "1"
        cell.totalLabel.text = String(format: "%.2f", (item.prix)) + "€"
        cell.plusButtonPressed = {
            if let quantityLabel = cell.quantityLabel.text, var quantityValue = Int(quantityLabel) {
                quantityValue += 1
                    cell.quantityLabel.text = "\(quantityValue)"
                let totalLine = (Double(quantityValue) * item.prix)
                cell.totalLabel.text = String(format: "%.2f", totalLine) + "€"
                ItemsService.shared.BasketItems[indexPath.row].montant = totalLine
                self.calculateTotal()
            }
        }
        cell.minusButtonPressed = {
            self.BasketFooterView.montantTotal.text = String(format: "%.2f", self.montantTotal)
            if let quantityLabel = cell.quantityLabel.text, var quantityValue = Int(quantityLabel) {
                if quantityValue > 0 {
                    quantityValue -= 1
                    cell.quantityLabel.text = "\(quantityValue)"
                    let totalLine = (Double(quantityValue) * item.prix)
                    cell.totalLabel.text = String(format: "%.2f", totalLine) + "€"
                    ItemsService.shared.BasketItems[indexPath.row].montant = totalLine
                    self.calculateTotal()
                } else {
                    cell.quantityLabel.text = "0"
                }
            }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ItemsService.shared.BasketItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            calculateTotal()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
