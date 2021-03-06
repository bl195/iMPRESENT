//
//  ViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

/**
    This class displays the log-in screen for iMPRESENT.
 It includes the name of the app, an image, and fields
 for the user to enter a username and password. 
 */
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
        
    }
    
    /**
        automatically sets the cursor to the password field
        once the user hits enter on the email field
    */
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
    
    /**
        sets up the layout constraints for the visual components
     (title of app, image, email/password log-in, and check-in button
    */
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
    
    /**
        When a user clicks on the check-in button, then the
     email entered will be saved to later be sent to the database
    */
    @IBAction func checkIn(_ sender: Any) {
        Items.sharedInstance.user = emailField.text ?? "no email"
        let introVC = storyboard?.instantiateViewController(withIdentifier: "IntroViewController")
        self.present(introVC!, animated:true, completion: nil)
    }

}

