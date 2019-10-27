//
//  MainTableViewController.swift
//  iMPRESENT
//
//  Created by Luiza on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.blue.cgColor, UIColor.yellow.cgColor]
        layer.startPoint = CGPoint(x:0,y:0)
        layer.endPoint = CGPoint(x:1,y:1)
        view.layer.addSublayer(layer)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
