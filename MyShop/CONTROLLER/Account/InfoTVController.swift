//
//  InfoTVController.swift
//  MyShop
//
//  Created by fred on 27/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit

class InfoTVController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var imageProfil: UIImageView!
    @IBOutlet var nomTF: RoundedTextField! {
        didSet {
            nomTF.tag = 1
            nomTF.becomeFirstResponder()
            nomTF.delegate = self
        }
    }
    @IBOutlet var prenomTF: RoundedTextField! {
        didSet {
            prenomTF.tag = 2
            prenomTF.delegate = self
        }
    }
    @IBOutlet var pseudoTF: RoundedTextField! {
        didSet {
            pseudoTF.tag = 3
            pseudoTF.delegate = self
        }
    }
    @IBOutlet var adresseTF: RoundedTextField! {
        didSet {
            adresseTF.tag = 4
            adresseTF.delegate = self
        }
    }
    @IBOutlet var codePostalTF: RoundedTextField! {
        didSet {
            codePostalTF.tag = 5
            codePostalTF.delegate = self
        }
    }
    @IBOutlet var villeTF: RoundedTextField! {
        didSet {
            villeTF.tag = 6
            villeTF.delegate = self
        }
    }
    @IBOutlet var telephoneTF: RoundedTextField! {
        didSet {
            telephoneTF.tag = 7
            telephoneTF.delegate = self
        }
    }
    @IBOutlet var emailTF: RoundedTextField! {
        didSet {
            emailTF.tag = 8
            emailTF.delegate = self
        }
    }
    @IBOutlet var observationsTV: UITextView! {
        didSet {
            observationsTV.tag = 9
            observationsTV.layer.cornerRadius = 5.0
            observationsTV.layer.masksToBounds = true
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    
// MARK: - TableView Delegate
    // pour afficher une alerte avec choix album ou appareil photo
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            nomTF.resignFirstResponder()
            imageProfil.becomeFirstResponder()
            let photoSourceController = UIAlertController(title: "", message: "Choississez votre image", preferredStyle: .actionSheet)
            
            let cameraAction = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = true
                    imagePicker.sourceType = .camera
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            let albumPhotoAction = UIAlertAction(title: "Album photo", style: .default) { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = true
                    imagePicker.sourceType = .photoLibrary
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            
            photoSourceController.addAction(cameraAction)
            photoSourceController.addAction(albumPhotoAction)
            
            present(photoSourceController, animated: true, completion: nil)
        }
    }
    
// MARK: - Fonction pour les textFields
    // pour passer au champs suivant (tag) quand on appui sur retour
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let prochainTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            prochainTextField.becomeFirstResponder()
        }
        return true
    }
}
extension InfoTVController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        nomTF.resignFirstResponder()
        imageProfil.becomeFirstResponder()
        
        if let editedImage = info[.editedImage] as? UIImage {
            imageProfil.image = editedImage.withRenderingMode(.alwaysOriginal)
            
        } else if let originalImage = info[.originalImage] as? UIImage {
            imageProfil.image = originalImage.withRenderingMode(.alwaysOriginal)
        }
        imageProfil.layer.cornerRadius = 90
        imageProfil.layer.masksToBounds = true
            
        dismiss(animated: true, completion: nil)
    }
    
}
