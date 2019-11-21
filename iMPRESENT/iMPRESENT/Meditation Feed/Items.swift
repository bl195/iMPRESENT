//
//  Items.swift
//  iMPRESENT
//
//  Created by codeplus on 11/17/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import Foundation

class Items{
    static let sharedInstance = Items()
    var meditations = [Meditation]()
    var pastMeditations = [Meditation]()
    var names = ["Body Scan", "Loving Kindness", "Inner Focus"]
    var discoverMore = ["Self Compassion Break", "Inner Focus","Grow Yourself","Accepting & Letting Go","Body Scan","Loving Kindness"]
    var audios = ["Body Scan","Affectionate Breathing","Letting Go and Letting Be","Meditation for Fertility", "Wisdom for Your Future Self"]
    var images = ["Plant","Think","Lily","Plant","Think","Lily"]
    
    func initialize()->(){
        for i in (0...audios.count){
            let title = audios[i]
            let image = images[i]
            let med = Meditation.init(title: title, file: title, image: image)
            meditations.append(med)
        }
    }
}


