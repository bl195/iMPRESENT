//
//  IntroViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

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
    
    @IBAction func playVideo(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=CmhkmLFc74E")!, options: [:], completionHandler: nil)
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
