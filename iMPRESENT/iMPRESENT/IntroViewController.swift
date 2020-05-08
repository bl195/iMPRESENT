//
//  IntroViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

/**
    This class displays the introduction to meditation
 screen, which includes a button that links to a YouTube
 video giving a brief overview of meditation.
 */
class IntroViewController: UIViewController {
    
    var meditationVideoLink = "https://www.youtube.com/watch?v=CmhkmLFc74E"

    @IBOutlet weak var introLabel: UILabel!
    
    @IBOutlet weak var meditationLabel: UILabel!
    
    @IBOutlet weak var flowerImage: UIImageView!
    
    @IBOutlet weak var playVideoButton: UIButton!
    
    @IBOutlet weak var nextArrow: UIButton!
    
    override func viewDidLoad() {
        playVideoButton.layer.cornerRadius = playVideoButton.bounds.height/2
        playVideoButton.clipsToBounds = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /**
        After clicking the button "play", the user will listen
     to a YouTube video that introduces the importance of meditation.
    */
    @IBAction func playVideo(_ sender: Any) {
        UIApplication.shared.open(URL(string: meditationVideoLink)!, options: [:], completionHandler: nil)
    }
    


}
