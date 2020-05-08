//
//  Items.swift
//  iMPRESENT
//
//  Created by codeplus on 11/17/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import Foundation
/**
    The purpose of this class
 is to create a global shared instance
 that multiple controllers can modify. This is useful
 for creating a single object that can store the data
 needed to be sent to the database on a single run of the app. 
 */
class Items{
    
    static let sharedInstance = Items()
    var meditations = [Meditation]()
    var pastMeditations = [Meditation]()
    var names = ["Body Scan", "Loving Kindness", "Inner Focus"]
    var discoverMore = ["Self Compassion Break", "Inner Focus","Grow Yourself","Accepting & Letting Go","Body Scan","Loving Kindness"]
    var images = ["Plant","Think","Lily","Plant","Think","Lily"]
    
    //used to keep track of information throughout different screens
    //that will eventually be sent to database
    var user = ""
    var datetime = ""
    var stressLevelBefore = 0
    var emotion = ""
    var meditation = ""
    var stressLevelAfter = 0
    
}


