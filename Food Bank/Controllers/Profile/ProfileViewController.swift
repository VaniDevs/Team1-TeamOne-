//
//  ProfileViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var fibreLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var mealsLabel: UILabel!
    
    var stats: [String: Float] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        stats["sodium"] = 0
        stats["sugar"] = 0
        stats["calories"] = 0
        stats["protein"] = 0
        stats["sugar"] = 0
        stats["fibre"] = 0

        let realm = try! Realm()
        let foods = realm.objects(FoodDetail)
        for food in foods {
            let servings: Float = food.servingsPerContainer > 0 ? Float(food.servingsPerContainer) : Float(1.0)
            stats["calories"] = stats["calories"]! + (servings * food.calories)
            stats["sodium"] = stats["sodium"]! + (servings * food.sodium)
            stats["sugar"] = stats["sugar"]! + (servings * food.sugars)
            stats["protein"] = stats["protein"]! + (servings * food.protein)
            stats["fibre"] = stats["fibre"]! + (servings * food.dietaryFiber)
        }
        
        caloriesLabel.text = "\(Int(stats["calories"]!))"
        fibreLabel.text = "\(Int(stats["fibre"]!)) g"
        proteinLabel.text = "\(Int(stats["protein"]!)) g"
        mealsLabel.text = "\(Int(stats["calories"]! / (2000.0 / 3)))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openWebsite(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.foodbank.bc.ca")!)
        print("???")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
