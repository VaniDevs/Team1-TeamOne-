//
//  TopFoodStatsViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit

class TopFoodStatsViewController: FoodStatsTableViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupData(forItem item: FoodDetail) {
        super.setupData(forItem: item)
        
        if let topFood = item as? TopFood {
            itemNameLabel.text = topFood.desc
        }
        if let image = image {
            imageView.image = image
        }
        ingredientLabel.text = nil
        tableView.tableFooterView = UIView()
    }
}
