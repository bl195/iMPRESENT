//
//  ViewController.swift
//  iMPRESENT
//
//  Created by Brian Li on 10/27/19.
//  Copyright © 2019 CodePlus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var discoverMoreCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    var names = ["Body Scan", "Loving Kindness", "Inner Focus"]
    var discoverMore = ["Self Compassion Break", "Inner Focus","Grow Yourself","Accepting & Letting Go","Body Scan","Loving Kindness"]
    var images = ["Plant","Think","Lily","Plant","Think","Lily"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
        discoverMoreCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 5)
        discoverMoreCollectionView.backgroundColor = .clear
        discoverMoreCollectionView.backgroundView?.backgroundColor = .clear
        // Do any additional setup after loading the view.
    }
    
    func registerNib() {
        let nib = UINib(nibName: CollectionViewCell.nibName, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
            flowLayout.minimumInteritemSpacing = 20
        }
        
        let nib2 = UINib(nibName: MeditationCollectionViewCell.nibName, bundle: nil)
        discoverMoreCollectionView?.register(nib2, forCellWithReuseIdentifier: MeditationCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.discoverMoreCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
            flowLayout.minimumInteritemSpacing = 20
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(collectionView)
        if collectionView == self.discoverMoreCollectionView {
            return discoverMore.count
        } else {
            return names.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.discoverMoreCollectionView {
            if let cell = discoverMoreCollectionView.dequeueReusableCell(withReuseIdentifier: MeditationCollectionViewCell.reuseIdentifier,
                                                             for: indexPath) as? MeditationCollectionViewCell {
                let name = discoverMore[indexPath.row]
                let pic = images[indexPath.row]
                cell.configureCell(name: name, image: pic)
                return cell
            }
            return UICollectionViewCell()
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier,
                                                             for: indexPath) as? CollectionViewCell {
                let name = names[indexPath.row]
                cell.configureCell(name: name)
                return cell
            }
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
         if collectionView == self.discoverMoreCollectionView  {
            guard let cell: MeditationCollectionViewCell = Bundle.main.loadNibNamed(MeditationCollectionViewCell.nibName,
                                                                          owner: self,
                                                                          options: nil)?.first as? MeditationCollectionViewCell else {
                                                                            return CGSize.zero
            }
            //cell.configureCell(name: discoverMore[indexPath.row])
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return CGSize(width: 155, height: 110)
        } else {
            guard let cell: CollectionViewCell = Bundle.main.loadNibNamed(CollectionViewCell.nibName,
                                                                          owner: self,
                                                                          options: nil)?.first as? CollectionViewCell else {
                                                                            return CGSize.zero
            }
            //cell.configureCell(name: names[indexPath.row])
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return CGSize(width: 155, height: 110)
        }
    }
    
}

