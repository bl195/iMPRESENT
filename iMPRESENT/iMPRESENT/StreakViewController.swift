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
        
        print(Items.sharedInstance.user)
        print(Items.sharedInstance.datetime)
        print(Items.sharedInstance.stressLevelBefore)
        print(Items.sharedInstance.emotion)
        print(Items.sharedInstance.meditation)
        print(Items.sharedInstance.stressLevelAfter)
        
        self.createMed(_for: "https://impresent.appspot.com/meditations/", user: Items.sharedInstance.user, datetime: Items.sharedInstance.datetime, stressLevelBefore: Items.sharedInstance.stressLevelBefore, emotion: Items.sharedInstance.emotion, meditation: Items.sharedInstance.meditation, stressLevelAfter: Items.sharedInstance.stressLevelAfter)
        
    }
    

    func createMed(_for URLString:String, user: String, datetime: String, stressLevelBefore: Int, emotion: String, meditation: String, stressLevelAfter: Int) {
        
        guard let url = URL(string: URLString) else {return}
        
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let params = ["user": user, "datetime": datetime, "stressbefore": stressLevelBefore, "stressafter": stressLevelAfter, "emotions": emotion, "meditation": meditation] as [String : Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
        request.httpBody = jsonData
        print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            
            // APIs usually respond with the data you just sent in your POST request
            if let responseData = responseData {
                do {
                    let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                    print(json)
                } catch {
                    print(responseError)
                }
            }
        }
        task.resume()
        
    }

}

extension Date {
    //returns the day of week as number between 1 - 7, with 1 representing sunday and 7 representing saturday
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
