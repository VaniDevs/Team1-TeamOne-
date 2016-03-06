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
    @IBOutlet weak var top10: UIImageView!
    @IBOutlet weak var barcodeScan: UIButton!
    @IBOutlet weak var textSearch: UIButton!
    
    let images = [UIImage(named: "bean"), UIImage(named: "butter"), UIImage(named: "fish"),
                  UIImage(named: "flakes"), UIImage(named: "fruits"), UIImage(named: "honey"),
                  UIImage(named: "pasta"), UIImage(named: "soup"), UIImage(named: "veg"),
                  UIImage(named: "pasta_mac")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundView = UIImageView(image: UIImage(named: "main_bg"))
        
        self.view.bringSubviewToFront(top10)
        barcodeScan.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        barcodeScan.imageView?.contentMode = .ScaleAspectFit
        
        textSearch.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        textSearch.imageView?.contentMode = .ScaleAspectFit
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

