//
//  StreakViewController.swift
//  iMPRESENT
//
//  Created by Jessica Su on 11/21/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

/**
 This class is responsible for displaying the
 number of days in a row that a user has
 completed meditations. It is also responsible
 for sending all the information (user, feelings, meditation, etc.)
 to the database.
 */
class StreakViewController: UIViewController {
    
    
    @IBOutlet weak var numMeditations: UILabel!
    
    @IBOutlet weak var monImg: UIImageView!
    @IBOutlet weak var tuesImg: UIImageView!
    @IBOutlet weak var wedImg: UIImageView!
    @IBOutlet weak var thursImg: UIImageView!
    @IBOutlet weak var friImg: UIImageView!
    @IBOutlet weak var satImg: UIImageView!
    @IBOutlet weak var sunImg: UIImageView!
    
    var checkImage = UIImage(named: "check")
    var apiLink = "https://lit-wave-61686.herokuapp.com/meditations"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let day = Date().dayNumberOfWeek()!
        // Do any additional setup after loading the view.
        if (day == 1)   {//Sunday
            monImg.image = checkImage
            tuesImg.image = checkImage
            wedImg.image = checkImage
            thursImg.image = checkImage
            friImg.image = checkImage
            satImg.image = checkImage
            sunImg.image = checkImage
        }
        if (day > 1)  { //Monday
             monImg.image = checkImage
        }
        if (day > 2)  { //Tues
            tuesImg.image = checkImage
        }
        if (day > 3) { //Wed
            wedImg.image = checkImage
        }
        if (day > 4) { //Thurs
            thursImg.image = checkImage
        }
        if (day > 5)  { //Fri
            friImg.image = checkImage
        }
        if (day > 6)  { //Sat
            satImg.image = checkImage
        }

        self.createMed(_for: apiLink, user: Items.sharedInstance.user, datetime: Items.sharedInstance.datetime, stressLevelBefore: Items.sharedInstance.stressLevelBefore, emotion: Items.sharedInstance.emotion, meditation: Items.sharedInstance.meditation, stressLevelAfter: Items.sharedInstance.stressLevelAfter)
    }
    

    /**
        This function is responsible for creating a meditation
     in the database by sending a post request with information
     about the user, access time, stress level before/after, emotions,
     and the meditation chosen 
    */
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
            if let responseData = responseData {
                do {
                    let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                    print(json)
                } catch {
                    print(responseError ?? "error")
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
