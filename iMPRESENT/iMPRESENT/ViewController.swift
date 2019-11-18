//
//  ViewController.swift
//  iMPRESENT
//
//  Created by Brian Li on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var check_in_button: UIButton!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBOutlet weak var impresentLabel: UILabel!
    
    
    @IBOutlet weak var teardropImg: UIImageView!
    
    override func viewDidLoad() {
        check_in_button.layer.cornerRadius = 10
        check_in_button.clipsToBounds = true
        setUpLayout()
        emailField.delegate = self
        passwordField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(emailField.text ?? "no email")
        print(passwordField.text ?? "no password")
      
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        }
        else {
            passwordField.resignFirstResponder()
        }
        return true
    }
    
    private func setUpLayout() {
        let topImageContainerView = UIView()
        //topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        //enable autolayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //better to use trailing and leading anchor rather than left and right anchor
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(teardropImg)
        teardropImg.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        teardropImg.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        teardropImg.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 1).isActive = true
        
        //making sure the top container is 3/4 the size of the entire screen
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        impresentLabel.translatesAutoresizingMaskIntoConstraints = false
        impresentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        impresentLabel.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        
    }
    
    
    @IBAction func checkIn(_ sender: Any) {
        print(emailField.text ?? "no email")
        print(passwordField.text ?? "no password")
        
        let introVC = storyboard?.instantiateViewController(withIdentifier: "IntroViewController")
        self.present(introVC!, animated:true, completion: nil)
    }
    

}

