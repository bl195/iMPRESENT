//
//  MeditationCollectionViewCell.swift
//  iMPRESENT
//
//  Created by codeplus on 11/17/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class MeditationCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    var fontcolor = UIColor(red:1/255, green:33/255, blue:105/255,alpha:1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 243/255, green: 242/255, blue: 241/255, alpha: 1.0)
        self.title.textColor = fontcolor
        self.heightAnchor.constraint(equalToConstant: 210).isActive = true
        self.widthAnchor.constraint(equalToConstant: 175).isActive = true
        self.layer.cornerRadius = 30.0
    }
    
    class var reuseIdentifier: String {
        return "MeditationCellReuseIdentifier"
    }
    
    class var nibName: String {
        return "MeditationCollectionViewCell"
    }
    
    func configureCell(name: String, image: String) {
        self.title.text = name
        self.image.image = UIImage(named: image)
        self.title.attributedText = NSAttributedString(string: name.uppercased(), attributes: [NSAttributedString.Key.kern: 5.0, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 10)!])
    }
}
