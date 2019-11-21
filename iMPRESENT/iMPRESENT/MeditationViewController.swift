//
//  MeditationViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 11/20/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class MeditationViewController: UIViewController {
    
    
    @IBOutlet weak var meditationName: UILabel!
    
    
    @IBOutlet weak var meditationImage: UIImageView!
    
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var whiteBackground: UIView!
    var image = UIImage()
    var meditation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meditationImage.image = self.image
        meditationName.text = meditation
        meditationName.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        meditationName.attributedText = NSAttributedString(string: meditation.uppercased(), attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.kern: 5.0, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 30)!])
        
        playButton.layer.cornerRadius = playButton.bounds.height/2
        playButton.clipsToBounds = true
        
        whiteBackground.layer.cornerRadius = 20
        whiteBackground.clipsToBounds = true
        

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
