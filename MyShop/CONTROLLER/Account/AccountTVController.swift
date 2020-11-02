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
    
    @IBAction func unwindToAccount(segue: UIStoryboardSegue) { }
    // titre de section de la tableView
    var sections = [Section(categories: "Etat Connexion", name: ["e"]), Section(categories: "Mon Compte", name: ["a"]), Section(categories: "Mode de Livraison", name: ["b"]), Section(categories: "Mode de Paiement", name: ["c"]), Section(categories: "Récapitulatif", name: ["d"])]
    
    var connexion = ""
    var reception = ""
    var payment = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
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
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 2
        case 3: return 2
        case 4: return 1
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath) as! ActionTVCell
                if connexion == "on" {
                    cell.connectState.backgroundColor = .green
                    cell.stateLabel.text = "Vous êtes connecté"
                    cell.connexionBt.setTitle("Déconnexion", for: .normal)
                    cell.stateButton = {
                        print("déconnexion")
                        self.logOut() }
                } else {
                    cell.connectState.backgroundColor = .red
                    cell.stateLabel.text = "Vous êtes déconnecté"
                    cell.connexionBt.setTitle("Se connecter", for: .normal)
                    cell.stateButton = { print("déconnexion")
                        self.logIn() }
                }
            return cell
            default: fatalError()
            }
            
        case 1:
            switch indexPath.row {
            case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            return cell
            default: fatalError()
            }
            
        case 2:
            switch indexPath.row {
            case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectCell", for: indexPath) as! ChoiceTVCell
            if reception == "livraison" {
                cell.choiceState.backgroundColor = .red
            } else if reception == "click" {
                cell.choiceState.backgroundColor = .green
            } else {
                cell.choiceState.backgroundColor = .systemGray5 }
                cell.button = { self.reception = "click"
                                self.tableView.reloadData()
                                print("click & collect") }
            return cell
            
            case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath) as! ChoiceTVCell
            if reception == "click" {
                cell.choiceState.backgroundColor = .red
            } else if reception == "livraison" {
                cell.choiceState.backgroundColor = .green
            } else {
                cell.choiceState.backgroundColor = .systemGray5 }
                cell.button = {
                    if self.connexion == "on" {
                        guard let nom = UserInfo.shared.userInfo.name else { return }
                        guard let prenom = UserInfo.shared.userInfo.prenom else { return }
                        guard let adresse = UserInfo.shared.userInfo.adresse else { return }
                        guard let codePostal = UserInfo.shared.userInfo.codePostal else { return }
                        guard let ville = UserInfo.shared.userInfo.ville else { return }
                    
                        if (nom.count > 0) && (prenom.count > 0) && (adresse.count > 0) && (codePostal.count > 0) && ville.count > 0 {
                            self.reception = "livraison"
                            self.tableView.reloadData()
                            print("livraison à domicile")
                        } else {
                            print("complèter tous les champs")
                            let infoVC = self.storyboard?.instantiateViewController(identifier: "InfoTV") as! InfoTVController
                            self.navigationController?.pushViewController(infoVC, animated: true) }
                    } else {
                        let inscriptionVC = self.storyboard?.instantiateViewController(identifier: "InscriptionVC") as! InscriptionViewController
                        self.navigationController?.pushViewController(inscriptionVC, animated: true)
                    }
                }
                return cell
            default: fatalError()
            }
            
        case 3:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CarteCell", for: indexPath) as! ChoiceTVCell
                if reception == "paypal" {
                    cell.choiceState.backgroundColor = .red
                } else if reception == "carte" {
                    cell.choiceState.backgroundColor = .green
                } else {
                    cell.choiceState.backgroundColor = .systemGray5 }
                    cell.button = { self.reception = "carte"
                                    self.tableView.reloadData()
                                    print("carte bancaire") }
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PaypalCell", for: indexPath) as! ChoiceTVCell
                if reception == "carte" {
                    cell.choiceState.backgroundColor = .red
                } else if reception == "paypal" {
                    cell.choiceState.backgroundColor = .green
                } else {
                    cell.choiceState.backgroundColor = .systemGray5 }
                    cell.button = { self.reception = "paypal"
                                    self.tableView.reloadData()
                                    print("Paypal") }
                return cell
            default:
                fatalError()
            }
        case 4:
            switch indexPath.row {
            case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecapitulatifCell", for: indexPath) as! RecapTVCell
                
            return cell
        default:
            fatalError()
        }
        default:
            fatalError()
        }
    }
    
// MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: print("état de la connexion")
            default: fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
            if connexion == "on" {
                let infoVC = self.storyboard?.instantiateViewController(identifier: "InfoTV") as! InfoTVController
                self.navigationController?.pushViewController(infoVC, animated: true)
            } else {
                let inscriptionVC = self.storyboard?.instantiateViewController(identifier: "InscriptionVC") as! InscriptionViewController
                self.navigationController?.pushViewController(inscriptionVC, animated: true)
            }
            default: fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0: print("choix du magasins")
            case 1: print("choix livraison à domicile")
            default: fatalError()
            }
        case 3:
            switch indexPath.row {
            case 0: print("choix carte bancaire")
            case 1: print("choix Paypal")
            default: fatalError()
            }
        case 4:
            switch indexPath.row {
            case 0: print("récapitulatif")
            default: fatalError()
            }
        default: fatalError()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = .black
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 30))
        label.text = sections[section].categories
        label.textColor = .white
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
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
