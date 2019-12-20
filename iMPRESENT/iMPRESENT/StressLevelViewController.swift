//
//  StressLevelViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class StressLevelViewController: UIViewController {
    
    var stress = 0
    @IBOutlet weak var stressLevel: UILabel!
    
    @IBOutlet weak var stress_slider_level: UISlider!
     var happyfaceImage = UIImage(named: "happyface")
    var sadfaceImage = UIImage(named: "sadface")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeSliderImage(img: happyfaceImage!)

    }
    
    
    @IBAction func sliderAction(_ sender: Any) {
        stress = Int(round (stress_slider_level.value))
        stressLevel.text = "\(stress)"
        
        let slider_val = round (stress_slider_level.value)
        
        if (slider_val < 5) {
             changeSliderImage(img: happyfaceImage!)
        }
        if (slider_val >= 5) {
            changeSliderImage(img: sadfaceImage!)
        }
    }
    
    func changeSliderImage(img: UIImage) {
        stress_slider_level.setThumbImage(img, for: .normal)
        stress_slider_level.setThumbImage(img, for: .highlighted)
    }
    
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

