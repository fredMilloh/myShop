//
//  InscriptionViewController.swift
//  MyShop
//
//  Created by fred on 23/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class InscriptionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // sans Storyboard - tous en code
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "addPhoto.png").withRenderingMode(.alwaysOriginal), for: .normal) // withRenderingMode = même couleur et rendu que l'image originale
        
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
        return button
    }()
    
// MARK: - Sign In Fields
    
    let signInLabel: UILabel = {
        let lb =  UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Déjà Inscrit"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 14)
        lb.textAlignment = .center
        lb.backgroundColor = .systemPink
        lb.layer.cornerRadius = 5
        lb.layer.masksToBounds = true
        return lb
    }()
    
    let emailAvailableTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Votre Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        // quand les 3 champs sont bien complétés, la couleur du bouton signUp change
        tf.addTarget(self, action: #selector(handleTextSignInChange), for: .editingChanged)
        return tf
    }()
    
    let passwordAvailableTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Votre Password ******"
        tf.isSecureTextEntry = true // pour masquer les caractéres
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextSignInChange), for: .editingChanged)
        return tf
    }()
    
    let signInButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = .cyan
        //bt.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 14)
        bt.setTitle("Se connecter", for: .normal)
        //bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        // ajout de l'action quand on appui sur le bouton
        bt.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        // rend le bouton inactif
        bt.isEnabled = false
      return bt
    }()
    
// MARK: - SignUP Fields
    
    let signUpLabel: UILabel = {
        let lb =  UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Créer un compte"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 14)
        lb.textAlignment = .center
        lb.backgroundColor = .systemPink
        lb.layer.cornerRadius = 5
        lb.layer.masksToBounds = true
        return lb
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        // quand les 3 champs sont bien complétés, la couleur du bouton signUp change
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nom d'utilisateur"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password ******  mini 6 characters"
        tf.isSecureTextEntry = true // pour masquer les caractéres
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let signUpButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = .cyan
        //bt.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 14)
        bt.setTitle("Inscription", for: .normal)
        //bt.setTitleColor(.white, for: .normal)
        bt.layer.cornerRadius = 5
        // ajout de l'action quand on appui sur le bouton
        bt.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        // rend le bouton inactif
        bt.isEnabled = false
      return bt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        //setupButton()
        setupInputFields()
        setupSignInFields()
    }
    
    fileprivate func setupButton() {
        view.addSubview(addPhotoButton)
        // ajout contraintes spaciales
        addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600).isActive = true
        addPhotoButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
        addPhotoButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // onpeut aussi utiliser l'extension anchors()
        //addPhotoButton.anchors(top: , left: , bottom: , right: , topConstant: , leftConstant: , bottomConstant: , rightConstant: , width: , height: )
    }
    
    fileprivate func setupSignInFields() {
        
        let stackViewIn = UIStackView(arrangedSubviews: [signInLabel, emailAvailableTF, passwordAvailableTF, signInButton])
        stackViewIn.translatesAutoresizingMaskIntoConstraints = false
        stackViewIn.distribution = .fillEqually
        stackViewIn.axis = .vertical
        stackViewIn.spacing = 10
        
        view.addSubview(stackViewIn)
        
        // autre méthode pour ajouter des contraintes spaciales
        
        NSLayoutConstraint.activate([
            stackViewIn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackViewIn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            stackViewIn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            stackViewIn.heightAnchor.constraint(equalToConstant: 175)
        ])
 
        }
    
    fileprivate func setupInputFields() {
        
        let stackView = UIStackView(arrangedSubviews: [signUpLabel, emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        // autre méthode pour ajouter des contraintes spaciales
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 250)
        ])
        // NSLayoutConstaint peut être remplacé par extension anchors()
        //stackView.anchors(top: addPhotoButton, left: view.leftAnchor, bottom: nil, right: <#T##NSLayoutXAxisAnchor?#>, topConstant: 20, leftConstant: 40, bottomConstant: 0, rightConstant: <#T##CGFloat#>, width: 0, height: 200)
        }
    
//MARK: - Sign In
    
    @objc func handleSignIn() {
        guard let email = emailAvailableTF.text, email.count > 0 else { return }
        guard let password = passwordAvailableTF.text, password.count >= 6 else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                
                print("erreur lors de l'authentification", error.localizedDescription)
            } else {
                let ref = Database.database().reference()
                let userId = Auth.auth().currentUser?.uid
               
                ref.child("users").child(userId!).observeSingleEvent(of: .value) { (snapshot) in
                    let value = snapshot.value as? NSDictionary
                    let username = value?["username"] as? String ?? ""
                    let email = value?["email"] as? String ?? ""
                    let imageUrl = value?["imageUrl"] as? String ?? ""
                    let name = value?["name"] as? String ?? ""
                    let secondName = value?["secondName"] as? String ?? ""
                    let address = value?["address"] as? String ?? ""
                    let codePostal = value?["codePostal"] as? String ?? ""
                    let city = value?["city"] as? String ?? ""
                    let phoneNumber = value?["phoneNumber"] as? String ?? ""
                    
                    let currentUser = User(id: userId!, username: username, mail: email, imageUrl: imageUrl, name: name, prenom: secondName, adresse: address, phoneNumber: phoneNumber, codePostal: codePostal, ville: city)
                    UserInfo.shared.userInfo = currentUser
                    UserInfo.shared.connexion = "on"
                }
                let accountTVC = self.storyboard?.instantiateViewController(identifier: "AccountTVC") as! AccountTVController
                accountTVC.connexion = "on"
                self.navigationController?.pushViewController(accountTVC, animated: true)
                print("bienvenue : ", email)
            }
        }
        
    }

//MARK: - SignUp Firebase
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text, email.count > 0 else { return }
        guard let username = usernameTextField.text, username.count > 0 else { return }
        guard let password = passwordTextField.text, password.count > 4 else { return }
   
    // Auth Firebase
        Auth.auth().createUser(withEmail: email, password: password) { (user, error: Error?) in
            if let err = error {
                print("Echec pour la création de l'utilisateur : ", err)
            }
            print("L'utilisateur a été correctement créé : ", user?.user.uid ?? "")
            
    
    // Storage Firebase
            // la suite pour enregistrer l'image dans le dossier profil_images de Storage
            
            // permet de créer un nouveau fichier dans le dossier, a chaque création de profil
            let fileId = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("profil_images").child(fileId)
            
            guard let image = self.addPhotoButton.imageView?.image else { return }
            guard let uploadData = image.jpegData(compressionQuality: 0.3) else { return }
            
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if let error = error {
                    print("Echec pour uploader l'image du profil :", error)
                    return
                }
            storageRef.downloadURL { (downloadURL, error) in
                    guard let profilImageUrl = downloadURL?.absoluteString else { return }
                    print("Succès pour uploader l'image : ", profilImageUrl)
    

    // Database Firebase
                // la suite pour enregistrer dans database, les données de l'utilisateur
            
                guard let uid = user?.user.uid else { return }
                
                let userValues = ["username": username, "email": email, "password": password, "imageUrl": profilImageUrl]
                let values = [uid: userValues]
            
                Database.database().reference().child("users").updateChildValues(values) { (error, ref) in
                    if let error = error {
                        print("Echec sauvegarde informations utilisateur : ", error)
                        return
                    }
                    print("succés sauvegarde informations utilisateur")
                    let currentUser = User(id: uid, username: username, mail: email, imageUrl: profilImageUrl, name: "", prenom: "", adresse: "", phoneNumber: "", codePostal: "", ville: "")
                    UserInfo.shared.userInfo = currentUser
                    UserInfo.shared.connexion = "on"
                }
                let accountTVC = self.storyboard?.instantiateViewController(identifier: "AccountTVC") as! AccountTVController
                accountTVC.connexion = "on"
                self.navigationController?.pushViewController(accountTVC, animated: true)
                print("bienvenue : ", email)
            }
            }
            }
    }
 
//MARK: - Handle Text change
    
    @objc func handleTextSignInChange() {
        let isFormComplete = emailAvailableTF.text?.count ?? 0 > 0  && passwordAvailableTF.text?.count ?? 0 >= 6
        if isFormComplete {
            signInButton.isEnabled = true
            signInButton.backgroundColor = .systemPink
        } else {
            signInButton.isEnabled = false
            signInButton.backgroundColor = .cyan
        }
    }

    @objc func handleTextInputChange() {
        let isFormComplete = emailTextField.text?.count ?? 0 > 0 && usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 >= 6
        if isFormComplete {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = .systemPink
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = .cyan
        }
    }

//MARK: - Handle add photo
    
    @objc func handlePlusPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        //pour zoom la photo allowEditing
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true)
    }
    // func du delegate qui permet de selection une ou partie de l'image, et de la poser dans un tableau info, de type any, donc préciser cast
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // image originale print originalImage.size
        if let editedlImage = info[.editedImage] as? UIImage {
            addPhotoButton.setImage(editedlImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info[.originalImage] as? UIImage {
            addPhotoButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.width/2
        addPhotoButton.layer.masksToBounds = true
        
        dismiss(animated: true)
    }

}
