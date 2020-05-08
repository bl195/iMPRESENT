//
//  CustomSlider.swift
//  iMPRESENT
//
//  Created by Jessica Su on 11/15/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

/**
    This class is responsible for creating the custom slider
 seen on the StressLevelViewController screens 
 */
class CustomSlider: UISlider {

    @IBInspectable open var trackWidth:CGFloat = 2 {
        didSet {setNeedsDisplay()}
    }
    
    override open func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultBounds = super.trackRect(forBounds: bounds)
        
        return CGRect(
            x: defaultBounds.origin.x,
            y: defaultBounds.origin.y + defaultBounds.size.height/2 - trackWidth/2,
            width: defaultBounds.size.width,
            height: trackWidth
        )
    }

}
