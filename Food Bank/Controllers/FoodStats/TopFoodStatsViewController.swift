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
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupData() {
        super.setupData()
        
        if let itemName = item.itemName {
            itemNameLabel.text = itemName
        }
        if let ingredient = item.ingredient {
            itemDescriptionLabel.text = ingredient
        }
        
        ingredientLabel.text = nil
        
        tableView.tableFooterView = UIView()
    }
}
