//
//  MeditationViewViewController.swift
//  iMPRESENT
//
//  Created by codeplus on 11/20/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit
import AVFoundation

class MeditationViewController: UIViewController { 
    var player: AVAudioPlayer?
    var audioName = ""
    var audios = ["Body Scan","Affectionate Breathing","Letting Go and Letting Be","Meditation for Fertility", "Wisdom for Your Future Self"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Items.initialize()
        audioName = "Body Scan"
        playSound()

        // Do any additional setup after loading the view.
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: audioName, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
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
