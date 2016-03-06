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
        if let totalFat = item.totalFat {
            totalFatLabel.text = "\(totalFat) g"
        }
        if let saturatedFat = item.saturatedFat {
            saturatedFatLabel.text = "\(saturatedFat) g"
        }
        if let transFat = item.transFat {
            transFatLabel.text = "\(transFat) g"
        }
        if let cholesterol = item.cholesterol {
            cholesterolLabel.text = "\(cholesterol) mg"
        }
        if let sodium = item.sodium {
            sodiumLabel.text = "\(sodium) mg"
        }
        if let totalCarbs = item.totalCarbs {
            totalCarbsLabel.text = "\(totalCarbs) g"
        }
        if let dietaryFiber = item.dietaryFiber {
            dietaryFiberLabel.text = "\(dietaryFiber) g"
        }
        if let sugars = item.sugars {
            sugarsLabel.text = "\(sugars) g"
        }
        if let protein = item.protein {
            proteinLabel.text = "\(protein) g"
        }
        if let vitaminA = item.vitaminA {
            vitaminALabel.text = "\(vitaminA)%"
        }
        if let vitaminC = item.vitaminC {
            vitaminCLabel.text = "\(vitaminC)%"
        }
        if let calcium = item.calcium {
            calciumLabel.text = "\(calcium)%"
        }
        if let iron = item.iron {
            ironLabel.text = "\(iron)%"
        }
        if let ingredient = item.ingredient {
            ingredientLabel.text = ingredient
        }
    }
}
