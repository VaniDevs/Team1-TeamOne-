//
//  ResultViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class ResultViewController: FoodStatsTableViewController {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemBrandLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var matchLevelLabel: UILabel!
    @IBOutlet weak var matchDescriptionLabel: UILabel!
    @IBOutlet weak var matchProductLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    
    var matchedTopFood: TopFood?
    var bestStandardDeviation:Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compareFood()
    }
    
    override func setupData() {
        super.setupData()
        
        if let itemName = item.itemName {
            itemNameLabel.text = itemName
        }
        if let brandName = item.brandName {
            itemBrandLabel.text = brandName
        }
    }
    
    func compareFood() {
        let realm = try! Realm()
        let topFoods = realm.objects(TopFood)
        
        var matchedFood: TopFood?
        
        for topFood in topFoods {
            // item vs topFood
            
            if (topFood.calories == 0 || item.calories == 0) {
                continue // not comparable
            }
            
            let factor = topFood.calories / item.calories  // normalized factor
            
            var totalDeviation: Float = 0.0
            
            // totalFat
            totalDeviation += deviation(forNutrition: item.totalFat * factor, reference: topFood.totalFat)
            // saturatedFat
            totalDeviation += deviation(forNutrition: item.saturatedFat * factor, reference: topFood.saturatedFat)
            // transFat
            totalDeviation += deviation(forNutrition: item.transFat * factor, reference: topFood.transFat)
            // cholesterol
            totalDeviation += deviation(forNutrition: item.cholesterol * factor, reference: topFood.cholesterol)
            // sodium
            totalDeviation += deviation(forNutrition: item.sodium * factor, reference: topFood.sodium)
            // totalCarbs
            totalDeviation += deviation(forNutrition: item.totalCarbs * factor, reference: topFood.totalCarbs)
            // dietaryFiber
            totalDeviation += deviation(forNutrition: item.dietaryFiber * factor, reference: topFood.dietaryFiber)
            // sugars
            totalDeviation += deviation(forNutrition: item.sugars * factor, reference: topFood.sugars)
            // protein
            totalDeviation += deviation(forNutrition: item.protein * factor, reference: topFood.protein)
            // vitaminA
            totalDeviation += deviation(forNutrition: item.vitaminA * factor, reference: topFood.vitaminA)
            // vitaminC
            totalDeviation += deviation(forNutrition: item.vitaminC * factor, reference: topFood.vitaminC)
            // calcium
            totalDeviation += deviation(forNutrition: item.calcium * factor, reference: topFood.calcium)
            // iron
            totalDeviation += deviation(forNutrition: item.iron * factor, reference: topFood.iron)

            let standardDeviation = sqrtf(totalDeviation / 13.0)
            if standardDeviation < bestStandardDeviation {
                bestStandardDeviation = standardDeviation
                matchedFood = topFood
            }
        }
        
        matchedTopFood = matchedFood
        updateUI()
    }
    
    private func deviation(forNutrition food: Float, reference: Float) -> Float {
        if (reference == 0 && food != 0) || (reference != 0 && food == 0) {
            return 1
        }
        else if (reference == 0 && food  == 0) {
            return 0
        }
        else {
            return powf((food - reference) / reference, 2)
        }
    }
    
    private func updateUI() {
        if let matchedTopFood = matchedTopFood {
            if bestStandardDeviation > 0.9 {
                // no match
                matchLevelLabel.text = "Sorry!"
            }
            else if bestStandardDeviation > 0.8 {
                // good
                matchLevelLabel.text = "Good Choice!"
                matchProductLabel.text = matchedTopFood.desc
            }
            else {
                // awesome
                matchLevelLabel.text = "Awesome!"
                matchProductLabel.text = matchedTopFood.desc
            }
        }
    }
    
    @IBAction func addToDonation(sender: AnyObject) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self.item)
        }
    }
    
    func compareNutrition(button: UIButton) {
        
    }
    
    func goBack(button: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
}
