//
//  HomeViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = [UIImage(named: "pasta-rice"), UIImage(named: "canned-beans"), UIImage(named: "canned-fish-meat"),
                  UIImage(named: "canned-fruit"), UIImage(named: "canned-vegetables"), UIImage(named: "cereal"),
                  UIImage(named: "nut-butters"), UIImage(named: "pasta-sauces"), UIImage(named: "stew")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
   
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CircularImageCell", forIndexPath: indexPath) as! CircularImageCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("asdf")
    }
}

