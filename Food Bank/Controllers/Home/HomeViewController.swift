//
//  HomeViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var top10: UIImageView!
    @IBOutlet weak var barcodeScan: UIButton!
    @IBOutlet weak var textSearch: UIButton!
    
    let images = [UIImage(named: "fish"),
        UIImage(named: "bean"),
        UIImage(named: "butter"),
        UIImage(named: "pasta_mac"),
        UIImage(named: "veg"),
        UIImage(named: "fruits"),
        UIImage(named: "flakes"),
        UIImage(named: "soup")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundView = UIImageView(image: UIImage(named: "main_bg"))
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        self.view.bringSubviewToFront(top10)
        barcodeScan.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        barcodeScan.imageView?.contentMode = .ScaleAspectFit
        
        textSearch.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        textSearch.imageView?.contentMode = .ScaleAspectFit
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
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
        
        let vc = UIStoryboard(name: "TopFoodStats", bundle: nil).instantiateInitialViewController() as! TopFoodStatsViewController
        vc.image = images[indexPath.row]
        vc.title = "Top Food"
        let realm = try! Realm()
        let topFood = realm.objects(TopFood).filter("desc = %@", DataStore.topFoods[indexPath.row]).first
        vc.item = topFood
        navigationController?.pushViewController(vc, animated: true)
    }
}

