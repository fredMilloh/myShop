//
//  HomeViewController.swift
//  MyShop
//
//  Created by fred on 24/09/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit
import FirebaseFirestore


class HomeViewController: UIViewController {
    
    var infoPromo = "Profitez de la livraison gratuite dès 50 € d'achats"
    var infoPromoImage2: String { return "EspacePub4"}
    
    private var db = Firestore.firestore()
    
    @IBOutlet var HeaderView: HeaderView!
    @IBOutlet var HomeItemLeftView: UIView!
    @IBOutlet var HomeItemRightView: UIView!
    @IBOutlet var HomeTableView: UITableView!
    @IBOutlet var FooterView: FooterView!
    
    var tapGesture = UITapGestureRecognizer()
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCategories()
        promoHomeItems()
        HomeItemLeftView.addShadow()
        HomeItemRightView.addShadow()
        homeLeftViewTapGesture()
        homeRightViewTapGesture()
        animPromoView()
        animEspacePubView()
        searchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    fetchCategories()
    }
    
// MARK: - Fetch categoriesDB
    // Méthode pour récupérer les catégories de firestore
    func fetchCategories() {
        
        db.collection("categories").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else { print("NoDoc")
                return }
            ItemsService.shared.AllCategoriesDB = documents.map({ (queryDocumentSnapshot) -> CategoryDB in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                
                return CategoryDB(name: name)
            })
        }
        
        /*
        ItemsService.shared.AllCategoriesDB = [CategoryDB]()
        
        categoriesCollectionRef.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("error fetching docs : \(err)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let categorie = document.data()
                    let categorieName = categorie["name"] as? String ?? ""
                    let id = categorie["id"] as? String ?? ""
                    let newCategory = CategoryDB(id: id, name: categorieName)
                    
                    ItemsService.shared.AllCategoriesDB.append(newCategory)
                }
                self.HomeTableView.reloadData()
            }
        }
 */
    }

    
// MARK: - SearchBar
    
    func searchBar () {
         let resultsController = storyboard!.instantiateViewController(identifier: "SearchResult") as? SearchResultTVController
        searchController = UISearchController(searchResultsController: resultsController)
        self .navigationItem.searchController = searchController
    }
    
    func filterContent(for searchText: String) {
        
    }
    
// MARK: - Select item for ItemsView and give them value

    func promoHomeItems() {
        ItemsService.shared.AddPromo()
        let itemPromo = ItemsService.shared.Promo

        HeaderView.HomeItemLeftName.text = itemPromo[0].nom
        HeaderView.HomeItemLeftAuthor.text = itemPromo[0].auteur
        HeaderView.HomeItemLeftImage.image = UIImage(named: itemPromo[0].photo)

        HeaderView.HomeItemRightName.text = itemPromo[1].nom
        HeaderView.HomeItemRightAuthor.text = itemPromo[1].auteur
        HeaderView.HomeItemRightImage.image = UIImage(named: itemPromo[1].photo)

        HeaderView.InfoPromo.text = infoPromo
    }

// MARK: - TapGesture HomeItemsView

    func homeLeftViewTapGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(leftHandleTap(_:)))
        HomeItemLeftView.addGestureRecognizer(tapGesture)
    }

    @objc func leftHandleTap(_ sender: UITapGestureRecognizer) {
        if HomeItemLeftView.backgroundColor == UIColor.white {
            HomeItemLeftView.backgroundColor = UIColor.systemGray5
            
            let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
            let itemSelected = ItemsService.shared.Promo[0]
            itemTable.itemSelected = itemSelected
            self.navigationController?.pushViewController(itemTable, animated: true)
            print("geste reconnu")
        } else {
            HomeItemLeftView.backgroundColor = UIColor.white
        }
    }

    func homeRightViewTapGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(rightHandleTap(_:)))
        HomeItemRightView.addGestureRecognizer(tapGesture)
    }

    @objc func rightHandleTap(_ sender: UITapGestureRecognizer) {
        if HomeItemRightView.backgroundColor == UIColor.white {
            HomeItemRightView.backgroundColor = UIColor.systemGray5
            let itemTable = self.storyboard?.instantiateViewController(withIdentifier: "ItemTableView") as! ItemTableViewController
            let itemSelected = ItemsService.shared.Promo[1]
            itemTable.itemSelected = itemSelected
            self.navigationController?.pushViewController(itemTable, animated: true)
            
        } else {
            HomeItemRightView.backgroundColor = UIColor.white
        }
    }

// MARK: - Button to show AllCategoriesViewController

    @IBAction func toutVoirButton(_ sender: UIButton) {
        let categoriesTable = self.storyboard?.instantiateViewController(identifier: "CategoriesTable") as! AllCategoriesViewController
        
        self.navigationController?.pushViewController(categoriesTable, animated: true)
    }
    
// MARK: - Animation Footer
    
    func animPromoView() -> Void {
        
        let secondImageView = UIImageView(image: UIImage(named: "EspacePub4"))
        secondImageView.clipsToBounds = FooterView.imagePromoImage.clipsToBounds
        secondImageView.alpha = 0.0
        
        FooterView.imagePromoImage.insertSubview(secondImageView, aboveSubview: FooterView.imagePromoImage)
        
        UIView.animate(withDuration: 5.0, delay: 1.0, options: [.repeat] , animations: {
            let rotationX = CGAffineTransform.init(scaleX: 1, y: -1)
                        self.FooterView.imagePromoImage.transform = rotationX
            secondImageView.alpha = 1.0 }, completion: {_ in
            self.FooterView.imagePromoImage.image = secondImageView.image
            secondImageView.removeFromSuperview()
        })
    }
    
    func animEspacePubView() -> Void {
        UIView.animate(withDuration: 2, delay: 1.0, options: [.repeat], animations: {
            self.FooterView.espacePubLabel.alpha = 0
        }, completion: nil)
        
    }
}

// MARK: - Extensions

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        //return ItemsService.shared.AllCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }
        let item = ItemsService.shared.AllCategories[indexPath.row]
        cell.categoryLabel.text = item

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemsCollection = self.storyboard?.instantiateViewController(withIdentifier: "collectionView") as! ItemsCollectionViewController
        let categoryName = ItemsService.shared.AllCategoriesDB[indexPath.row].name
        itemsCollection.itemsCategory = categoryName
        self.navigationController?.pushViewController(itemsCollection, animated: true)
        
    }
}
