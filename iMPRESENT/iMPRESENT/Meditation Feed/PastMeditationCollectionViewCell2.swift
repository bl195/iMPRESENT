//
//  PastMeditationCollectionViewCell.swift
//  iMPRESENT
//
//  Created by codeplus on 11/17/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

//import UIKit
//
//class PastMeditationCollectionViewCell: UICollectionViewCell {
//    
//    @IBOutlet weak var nameLabel: UILabel!
//    var fontcolor = UIColor(red:1/255, green:33/255, blue:105/255,alpha:1.0)
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.backgroundColor = UIColor(red: 243/255, green: 242/255, blue: 241/255, alpha: 1.0)
//        self.nameLabel.textColor = fontcolor
//        self.heightAnchor.constraint(equalToConstant: 110).isActive = true
//        self.widthAnchor.constraint(equalToConstant: 155).isActive = true
//        self.layer.cornerRadius = 30.0
//        // Initialization code
//    }
//    
//    class var reuseIdentifier: String {
//        return "PastMeditationCell"
//    }
//    class var nibName: String {
//        return "PastMeditationCollectionViewCell"
//    }
//    func configureCell(name: String) {
//        self.nameLabel.text = name
//        self.nameLabel.attributedText = NSAttributedString(string: name.uppercased(), attributes: [NSAttributedString.Key.kern: 5.0, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 16)!])
//    }
//    
//    
//}
