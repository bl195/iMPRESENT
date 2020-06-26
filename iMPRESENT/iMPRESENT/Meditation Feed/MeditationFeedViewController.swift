//
//  MeditationFeedViewController.swift
//  iMPRESENT
//
//  Created by codeplus on 11/17/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class MeditationFeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var discoverMoreCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    var discoverMore = ["Meditation for Fertility", "Wisdom of Your Future Self","Letting Go & Letting Be","Body Scan","Loving Kindness for Self Compassion","Affectionate Breathing"]
    var images = ["Plant","Think","Lily","Plant","Think","Lily"]
    
    var meditations: [Meditation] = []
    
    
    func createMeditations() {
        var index = 0
        for discover in discoverMore {
            meditations.append(Meditation.init(title: discover, file: "", image: images[index]))
            index += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMeditations()
        registerNib()
        discoverMoreCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        discoverMoreCollectionView.backgroundColor = .clear
        discoverMoreCollectionView.backgroundView?.backgroundColor = .clear
        // Do any additional setup after loading the view.
    }
    
    func registerNib() {
        let nib2 = UINib(nibName: MeditationCollectionViewCell.nibName, bundle: nil)
        discoverMoreCollectionView?.register(nib2, forCellWithReuseIdentifier: MeditationCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.discoverMoreCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
            flowLayout.minimumInteritemSpacing = 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discoverMore.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = discoverMoreCollectionView.dequeueReusableCell(withReuseIdentifier: MeditationCollectionViewCell.reuseIdentifier,
                                                                     for: indexPath) as? MeditationCollectionViewCell {
            //let name = discoverMore[indexPath.row]
            //let pic = images[indexPath.row]
            let med = meditations[indexPath.row]
            cell.configureCell(name: med.title, image: med.image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: MeditationCollectionViewCell = Bundle.main.loadNibNamed(MeditationCollectionViewCell.nibName,
                                                                                owner: self,
                                                                                options: nil)?.first as? MeditationCollectionViewCell else {
                                                                                    return CGSize.zero
        }
        //cell.configureCell(name: discoverMore[indexPath.row])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return CGSize(width: 155, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.discoverMoreCollectionView {
            let medVC = storyboard?.instantiateViewController(withIdentifier: "MeditationViewController") as? MeditationViewController
            let currMeditation = meditations[indexPath.row]
            medVC?.meditation = currMeditation.title
            medVC?.image = UIImage(named: currMeditation.image ?? "Lily")!
            
           
            
            present(medVC!, animated: true)
        }
    }
    

}
