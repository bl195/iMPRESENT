//
//  MeditationViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 11/20/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit
import AVFoundation


class MeditationViewController: UIViewController {
    
    //progress bar for time
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer: Timer?
    
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var playedTime: UILabel!
    @IBOutlet weak var meditationName: UILabel!
    
    
    @IBOutlet weak var meditationImage: UIImageView!
    
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var whiteBackground: UIView!
    var image = UIImage()
    var meditation = ""
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meditationImage.image = self.image
        meditationName.text = meditation
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        meditationName.attributedText = NSAttributedString(string: meditation.uppercased(), attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.kern: 5.0, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 30)!])
         meditationName.numberOfLines = 0
        
        playButton.layer.cornerRadius = playButton.bounds.height/2
        playButton.clipsToBounds = true
        
        whiteBackground.layer.cornerRadius = 20
        whiteBackground.clipsToBounds = true
        
       
        
        //updateAudioProgressView()
        
        
//        let currentTimeLabel: UILabel = {
//            let label = UILabel()
//            label.text = "00:00"
//        }
        //progressBar.setProgress(Float(player!.currentTime / player!.duration), animated: false)

    }
    
    
    @objc func updateAudioProgressView()
    {
        //print(player!.currentTime)
        if player!.isPlaying
        {
            progressBar.setProgress(Float(player!.currentTime / player!.duration), animated: false)
        }
        
        let currentTime = Int(player!.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        playedTime.text = String(format: "%02d:%02d", minutes,seconds) as String
    }
    
    var presscount = 0
    @IBAction func playButtonPressed(_ sender: Any) {
        if presscount == 0{
            playSound()
            //playButton.titleLabel?.text = "PAUSE"
            self.playButton.setTitle("PAUSE", for: .normal)

        }
        else if presscount % 2 == 0{
            self.player?.play()
            //playSound()
            //self.playButton.titleLabel?.text = "PAUSE"
            self.playButton.setTitle("PAUSE", for: .normal)

        } else {
            self.player?.pause()
            //self.playButton.titleLabel?.text = "PLAY"
            self.playButton.setTitle("PLAY", for: .normal)

        }
        presscount += 1
    }
    
    func playSound() {
        print("HERE")
        print(meditation)
        guard let url = Bundle.main.url(forResource: meditation, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(self.updateAudioProgressView), userInfo: nil, repeats: true)
            progressBar.setProgress(Float(player.currentTime / player.duration), animated: false)
            
            let duration = Int(player.duration)
            let minutes = duration/60
            let seconds = duration - minutes * 60
            
            endTime.text = String(format: "%02d:%02d", minutes,seconds) as String
            
//            player.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
//            let interval = CMTime(value: 1, timescale: 2)
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        //updating the meditation
        Items.sharedInstance.meditation = self.meditation
        print(Items.sharedInstance.meditation)
        
        //updating the current time
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        let curr_time = formatter.string(from: currentDateTime)
        Items.sharedInstance.datetime = curr_time
        
        let afterStressLevelVC = storyboard?.instantiateViewController(withIdentifier: "afterStressLevelViewController") as? StressLevelViewController
        present(afterStressLevelVC!, animated: true)
    }
    
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "currentItem.loadedTimeRanges" {
//            if let duration = self.player?.currentTime {
//                let seconds = duration
//                let secondsText = Int(seconds) % 60
//                let minutesText = String(format: "%02d", Int(seconds) / 60)
//            }
//        }
//    }

}
