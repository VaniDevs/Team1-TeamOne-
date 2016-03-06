//
//  HistoryTableViewController.swift
//  Food Bank
//
//  Created by Dominic Kuang on 03/06/16.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var foods: Results<FoodDetail>?
    
    let dateFormatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        dateFormatter.dateFormat = "MMM dd, YYYY"
        
        let realm = try! Realm()
        foods = realm.objects(FoodDetail)
        self.tableView.tableFooterView = UIView()
        self.tableView.reloadData()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFoodHistory" {
            if let dvc = segue.destinationViewController as? TopFoodStatsViewController {
                dvc.item = foods![tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}

extension HistoryTableViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(foods?.count)
        return foods != nil ? foods!.count : 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryTableViewCell") as! HistoryTableViewCell
        let food = foods![indexPath.row]
        cell.itemNameLabel.text = "\(food.itemName!)"
        cell.donationDateLabel.text = "\(dateFormatter.stringFromDate(food.updatedDate))"
        return cell
    }
}

extension HistoryTableViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Result", bundle: nil).instantiateInitialViewController() as! ResultViewController
        vc.item = foods![indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
