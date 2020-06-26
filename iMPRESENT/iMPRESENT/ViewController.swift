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
    
    
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var teardropImg: UIImageView!
    
        @IBOutlet weak var joyful: UIButton!
     
        @IBOutlet weak var compassionate: UIButton!
        @IBOutlet weak var p: UIButton!
        @IBOutlet weak var h: UIButton!
        @IBOutlet weak var u: UIButton!
        @IBOutlet weak var r: UIButton!
        @IBOutlet weak var s: UIButton!
        @IBOutlet weak var l: UIButton!
        
        @IBOutlet weak var st: UIButton!
        @IBOutlet weak var sc: UIButton!
        
        @IBOutlet weak var sh: UIButton!
        @IBOutlet weak var g: UIButton!
        @IBOutlet weak var a: UIButton!
        
        @IBOutlet weak var o: UIButton!
        
        @IBOutlet weak var an: UIButton!
        
        @IBOutlet weak var f: UIButton!
        
        @IBOutlet weak var re: UIButton!
        
    var valid:String = ""
    
    override func viewDidLoad() {
        check_in_button.layer.cornerRadius = 10
        check_in_button.clipsToBounds = true
        setUpLayout()
        emailField.delegate = self
        passwordField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       errorMessage.text = ""
        
        
        
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
        Items.sharedInstance.user = emailField.text ?? "no email"
        
        validate(withCompletion:{
            if self.valid == "User does not exist"{
                print("user doesnt exist")
                DispatchQueue.main.async {
                    self.self.errorMessage.text = "User does not exist"
                }
            } else if self.valid == "Success" {
                let introVC = self.storyboard!.instantiateViewController(withIdentifier: "IntroViewController")
                print("Im here?")
                DispatchQueue.main.async {
                    self.present(introVC, animated:true, completion: nil)
                }
            } else {
                print("wrong pass")
                DispatchQueue.main.async {
                    self.self.errorMessage.text = "Your password is incorrect"
                }
            }
        })

    }
    
    func validate(withCompletion completion: @escaping (() -> Void)) {
        guard let url = URL(string: Items.init().webroot + "/users/validate") else {return}
        
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let params = ["email": emailField.text!, "userpassword": passwordField.text!, "username":"app", "password":Items.init().appKey] as [String : Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
        request.httpBody = jsonData
        print(url)
        print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { (responseData, response, responseError) in
            
            // APIs usually respond with the data you just sent in your POST request
            if let responseData = responseData {
                do {
                    let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String:Any]
                    print(json)
                    var message = json!["message"] as! String
                    self.valid = message
                    completion()
                } catch {
                    print(responseError)
                }
            }
        })
        task.resume()
        
        
    }

    

    
  
    
    

}

