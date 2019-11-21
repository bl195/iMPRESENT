//
//  feelingViewController.swift
//  iMPRESENT
//
//  Created by Brian Li on 11/18/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class feelingViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.title)
        
        compassionate.backgroundColor = .clear
        compassionate.layer.cornerRadius = 10
        compassionate.layer.borderWidth = 1
        compassionate.layer.borderColor = UIColor.white.cgColor
        joyful.backgroundColor = .clear
        joyful.layer.cornerRadius = 10
        joyful.layer.borderWidth = 1
        joyful.layer.borderColor = UIColor.white.cgColor
        p.backgroundColor = .clear
        p.layer.cornerRadius = 10
        p.layer.borderWidth = 1
        p.layer.borderColor = UIColor.white.cgColor
        h.backgroundColor = .clear
        h.layer.cornerRadius = 10
        h.layer.borderWidth = 1
        h.layer.borderColor = UIColor.white.cgColor
        r.backgroundColor = .clear
        r.layer.cornerRadius = 10
        r.layer.borderWidth = 1
        r .layer.borderColor = UIColor.white.cgColor
        u.backgroundColor = .clear
        u.layer.cornerRadius = 10
        u.layer.borderWidth = 1
        u.layer.borderColor = UIColor.white.cgColor
        s.backgroundColor = .clear
        s.layer.cornerRadius = 10
        s.layer.borderWidth = 1
        s.layer.borderColor = UIColor.white.cgColor
        l.backgroundColor = .clear
        l.layer.cornerRadius = 10
        l.layer.borderWidth = 1
        l.layer.borderColor = UIColor.white.cgColor
        st.backgroundColor = .clear
        st.layer.cornerRadius = 10
        st.layer.borderWidth = 1
        st.layer.borderColor = UIColor.white.cgColor
        a.backgroundColor = .clear
        a.layer.cornerRadius = 10
        a.layer.borderWidth = 1
        a.layer.borderColor = UIColor.white.cgColor
        g.backgroundColor = .clear
        g.layer.cornerRadius = 10
        g.layer.borderWidth = 1
        g.layer.borderColor = UIColor.white.cgColor
        sc.backgroundColor = .clear
        sc.layer.cornerRadius = 10
        sc.layer.borderWidth = 1
        sc.layer.borderColor = UIColor.white.cgColor
        sh.backgroundColor = .clear
        sh.layer.cornerRadius = 10
        sh.layer.borderWidth = 1
        sh.layer.borderColor = UIColor.white.cgColor
        o.backgroundColor = .clear
        o.layer.cornerRadius = 10
        o.layer.borderWidth = 1
        o.layer.borderColor = UIColor.white.cgColor
        an.backgroundColor = .clear
        an.layer.cornerRadius = 10
        an.layer.borderWidth = 1
        an.layer.borderColor = UIColor.white.cgColor
        f.backgroundColor = .clear
        f.layer.cornerRadius = 10
        f.layer.borderWidth = 1
        f.layer.borderColor = UIColor.white.cgColor
        re.backgroundColor = .clear
        re.layer.cornerRadius = 10
        re.layer.borderWidth = 1
        re.layer.borderColor = UIColor.white.cgColor
        
        //        let bgcolor = hexStringToUIColor(hex: "#012169")
        //        let bgcolor1 = hexStringToUIColor(hex: "#00539B")
        //        let layer = CAGradientLayer()
        //
        //        layer.frame = view.bounds
        //
        //        layer.colors = [bgcolor.cgColor, bgcolor1.cgColor]
        //
        //        layer.startPoint = CGPoint(x:0,y:0)
        //
        //        layer.endPoint = CGPoint(x:1,y:1)
        //
        //        view.layer.addSublayer(layer)
        //        // Do any additional setup after loading the view.
        
        //            .backgroundColor = .clear
        //            .layer.cornerRadius = 10
        //            .layer.borderWidth = 1
        //            .layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func compassionPressed(_ sender: Any) {
        if (self.title! == "firstFeelingViewController") {
            let meditateVC = storyboard?.instantiateViewController(withIdentifier: "MeditationFeedViewController") as? MeditationFeedViewController
            present(meditateVC!, animated: true)
            
        } else {
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
