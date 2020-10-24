//
//  InscriptionViewController.swift
//  MyShop
//
//  Created by fred on 23/10/2020.
//  Copyright © 2020 fred. All rights reserved.
//

import UIKit
import FirebaseAuth

class InscriptionViewController: UIViewController {
    
    // sans Storyboard - tous en code
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "addPhoto.png").withRenderingMode(.alwaysOriginal), for: .normal) // withRenderingMode = même couleur et rendu que l'image originale
        return button
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

        setupButton()
        setupInputFields()
    }
    
    fileprivate func setupButton() {
        view.addSubview(addPhotoButton)
        // ajout contraintes spaciales
        addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        addPhotoButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
        addPhotoButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // onpeut aussi utiliser l'extension anchors()
        //addPhotoButton.anchors(top: , left: , bottom: , right: , topConstant: , leftConstant: , bottomConstant: , rightConstant: , width: , height: )
    }
    
    fileprivate func setupInputFields() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        // autre méthode pour ajouter des contraintes spaciales
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        // NSLayoutConstaint peut être remplacé par extension anchors()
        //stackView.anchors(top: addPhotoButton, left: view.leftAnchor, bottom: nil, right: <#T##NSLayoutXAxisAnchor?#>, topConstant: 20, leftConstant: 40, bottomConstant: 0, rightConstant: <#T##CGFloat#>, width: 0, height: 200)
        }
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text, email.count > 0 else { return }
        guard let username = usernameTextField.text, username.count > 0 else { return }
        guard let password = passwordTextField.text, password.count > 4 else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error: Error?) in
            if let err = error {
                print("Echec pour la création de l'utilisateur : ", err)
            }
            print("L'utilisateur a été correctement créé : ", user?.user.uid ?? "")
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

}
