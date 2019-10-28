//
//  ViewController.swift
//  iMPRESENT
//
//  Created by Brian Li on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bgcolor = hexStringToUIColor(hex: "#012169")
        var bgcolor1 = hexStringToUIColor(hex: "#00539B")
        let layer = CAGradientLayer()
        
        layer.frame = view.bounds
        
        
        
        layer.colors = [bgcolor.cgColor, bgcolor1.cgColor]
        
        layer.startPoint = CGPoint(x:0,y:0)
        
        layer.endPoint = CGPoint(x:1,y:1)
        
        view.layer.addSublayer(layer)
        // Do any additional setup after loading the view.
    }


}

