//
//  StreakViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 11/21/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class StreakViewController: UIViewController {
    
    
    @IBOutlet weak var numMeditations: UILabel!
    
    @IBOutlet weak var monImg: UIImageView!
    @IBOutlet weak var tuesImg: UIImageView!
    @IBOutlet weak var wedImg: UIImageView!
    @IBOutlet weak var thursImg: UIImageView!
    @IBOutlet weak var friImg: UIImageView!
    @IBOutlet weak var satImg: UIImageView!
    @IBOutlet weak var sunImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let day = Date().dayNumberOfWeek()!
        // Do any additional setup after loading the view.
        if (day == 1)   {//Sunday
            monImg.image = UIImage(named: "check")
            tuesImg.image = UIImage(named: "check")
            wedImg.image = UIImage(named: "check")
            thursImg.image = UIImage(named: "check")
            friImg.image = UIImage(named: "check")
            satImg.image = UIImage(named: "check")
            sunImg.image = UIImage(named: "check")
        }
        if (day > 1)  { //Monday
             monImg.image = UIImage(named: "check")
        }
        if (day > 2)  { //Tues
            tuesImg.image = UIImage(named: "check")
        }
        if (day > 3) { //Wed
            wedImg.image = UIImage(named: "check")
        }
        if (day > 4) { //Thurs
            thursImg.image = UIImage(named: "check")
        }
        if (day > 5)  { //Fri
            friImg.image = UIImage(named: "check")
        }
        if (day > 6)  { //Sat
            satImg.image = UIImage(named: "check")
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

extension Date {
    //returns the day of week as number between 1 - 7, with 1 representing sunday and 7 representing saturday
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
