//
//  AccountTVController.swift
//  MyShop
//
//  Created by fred on 26/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit
import FirebaseAuth

class AccountTVController: UITableViewController {
    
    @IBAction func unwindToAccount(segue: UIStoryboardSegue) {
        
    }
    
    var connexion = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
     func logOut() {
        do {
            try Auth.auth().signOut()
            tableView.reloadData()
            connexion = "off"
            tableView.reloadData()
        } catch {
          print("erreur de déconnexion")
        }
        print("Vous êtes déconnecté")
    }
    
     func logIn() {
        let inscriptionVC = self.storyboard?.instantiateViewController(identifier: "InscriptionVC") as! InscriptionViewController
        self.navigationController?.pushViewController(inscriptionVC, animated: true)
    }

// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTVCell
            if connexion == "on" {
                    cell.connectState.backgroundColor = .green
                    cell.stateLabel.text = "Vous êtes connecté"
                    cell.connexionBt.setTitle("Déconnexion", for: .normal)
                    cell.stateButton = {
                        print("déconnexion")
                        self.logOut()
                    }
                } else {
                    cell.connectState.backgroundColor = .red
                    cell.stateLabel.text = "Vous êtes déconnecté"
                    cell.connexionBt.setTitle("Se connecter", for: .normal)
                    cell.stateButton = { print("déconnexion")
                        self.logIn() }
                }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            
            return cell
            
        default:
            fatalError()
        }
    }
    
// MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("état de la connexion du compte")
        case 1:
            if connexion == "on" {
                let infoVC = self.storyboard?.instantiateViewController(identifier: "InfoTV") as! InfoTVController
                self.navigationController?.pushViewController(infoVC, animated: true)
            } else {
                let inscriptionVC = self.storyboard?.instantiateViewController(identifier: "InscriptionVC") as! InscriptionViewController
                self.navigationController?.pushViewController(inscriptionVC, animated: true)
            }
        default:
            fatalError()
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
