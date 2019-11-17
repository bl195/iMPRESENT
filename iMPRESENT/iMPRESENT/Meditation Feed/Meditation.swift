//
//  Meditation.swift
//  iMPRESENT
//
//  Created by codeplus on 11/17/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import Foundation

class Meditation{
    var title: String
    var file: String?
    var image: String?
    
    init(title:String, file:String?, image:String?){
        self.title = title
        self.file = file ?? "default_path"
        self.image = image ?? "Lily"
    }
}
