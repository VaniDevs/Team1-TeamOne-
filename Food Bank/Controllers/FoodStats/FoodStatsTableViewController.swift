//
//  FoodStatsTableViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit

class FoodStatsTableViewController: UITableViewController {
    
    var item: FoodDetail!
    
    @IBOutlet weak var totalFatLabel: UILabel!
    @IBOutlet weak var saturatedFatLabel: UILabel!
    @IBOutlet weak var transFatLabel: UILabel!
    @IBOutlet weak var cholesterolLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var totalCarbsLabel: UILabel!
    @IBOutlet weak var dietaryFiberLabel: UILabel!
    @IBOutlet weak var sugarsLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var vitaminALabel: UILabel!
    @IBOutlet weak var vitaminCLabel: UILabel!
    @IBOutlet weak var calciumLabel: UILabel!
    @IBOutlet weak var ironLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
    }
    
    func setupData() {
        totalFatLabel.text = "\(item.totalFat) g"
        saturatedFatLabel.text = "\(item.saturatedFat) g"
        transFatLabel.text = "\(item.transFat) g"
        cholesterolLabel.text = "\(item.cholesterol) mg"
        sodiumLabel.text = "\(item.sodium) mg"
        totalCarbsLabel.text = "\(item.totalCarbs) g"
        dietaryFiberLabel.text = "\(item.dietaryFiber) g"
        sugarsLabel.text = "\(item.sugars) g"
        proteinLabel.text = "\(item.protein) g"
        vitaminALabel.text = "\(item.vitaminA)%"
        vitaminCLabel.text = "\(item.vitaminC)%"
        calciumLabel.text = "\(item.calcium)%"
        ironLabel.text = "\(item.iron)%"
        ingredientLabel.text = item.ingredient
    }
}
