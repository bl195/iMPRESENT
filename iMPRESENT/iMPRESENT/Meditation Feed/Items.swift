//
//  Items.swift
//  iMPRESENT
//
//  Created by codeplus on 11/17/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import Foundation

class Items{
    
    // i dont think this is doing anything, delete later
    static let sharedInstance = Items()
    var meditations = [Meditation]()
    var pastMeditations = [Meditation]()
    var names = ["Body Scan", "Loving Kindness", "Inner Focus"]
    var discoverMore = ["Self Compassion Break", "Inner Focus","Grow Yourself","Accepting & Letting Go","Body Scan","Loving Kindness"]
    var images = ["Plant","Think","Lily","Plant","Think","Lily"]
    
    var user = ""
    var datetime = ""
    var stressLevelBefore = 0
   
    var emotion = ""
    var meditation = ""
    var stressLevelAfter = 0
    
//    {
//        for name in names{
//            let med = Meditation.init(title: name, file: "", image: "")
//            pastMeditations.append(med)
//        }
//        for i in (0...discoverMore.count){
//            let title = discoverMore[i]
//            let image = images[i]
//            let med = Meditation.init(title: title, image: image, file: "")
//            meditations.append(med)
//        }
//    }
}


