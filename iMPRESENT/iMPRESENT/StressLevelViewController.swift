//
//  StressLevelViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

/**
    This class creates a slider where the user
 can rate his/her level of stress before and after
 listening to a meditation. 
 */
class StressLevelViewController: UIViewController {
    
    var stress = 0
    var halfStressLevel = 5
    
    @IBOutlet weak var stressLevel: UILabel!
    
    @IBOutlet weak var stress_slider_level: UISlider!
     var happyfaceImage = UIImage(named: "happyface")
    var sadfaceImage = UIImage(named: "sadface")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSliderImage(img: happyfaceImage!)

    }
    
    /**
        This function responds to the user's interaction
     with the slider by changing the text below the slider
     to match the level chosen and also change the image
     if the user is more stressed than the halfway point
    */
    @IBAction func sliderAction(_ sender: Any) {
        stress = Int(round (stress_slider_level.value))
        stressLevel.text = "\(stress)"
        
        let slider_val = round (stress_slider_level.value)
        
        if (Int(slider_val) < halfStressLevel) {
             changeSliderImage(img: happyfaceImage!)
        }
        if (Int(slider_val) >= halfStressLevel) {
            changeSliderImage(img: sadfaceImage!)
        }
    }
    
    /**
        This function changes the slider's image
     as the user moves past the halfway point
    */
    func changeSliderImage(img: UIImage) {
        stress_slider_level.setThumbImage(img, for: .normal)
        stress_slider_level.setThumbImage(img, for: .highlighted)
    }
    
    /**
        This function is responsbile for controlling
     which screen appears next after the stress level view controller -
     it is presented both BEFORE hearing the meditation and AFTER
     the meditation
    */
    @IBAction func nextButton(_ sender: Any) {
        if (self.title! == "StressLevelViewController") {
            Items.sharedInstance.stressLevelBefore = stress
            let feelingVC = storyboard?.instantiateViewController(withIdentifier: "firstFeelingViewController") as? feelingViewController
            present(feelingVC!, animated: true)
            
        } else {
            Items.sharedInstance.stressLevelAfter = stress
            let streakVC = storyboard?.instantiateViewController(withIdentifier: "StreakViewController") as? StreakViewController
            present(streakVC!, animated: true)
        }
       
    }
}
extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

