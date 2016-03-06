//
//  TextSearchViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import ObjectMapper

class TextSearchViewController: UIViewController {

    var searchBar = UISearchBar()
    
    var results = [SearchItem]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.emptyDataSetSource = self
        tableView.tableFooterView = UIView()
        
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "cancelAction:")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        searchBar.becomeFirstResponder()
    }

    func cancelAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension TextSearchViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchCell")!
        let item = results[indexPath.row]
        cell.textLabel?.text = item.itemName
        cell.detailTextLabel?.text = item.brandName
        return cell
    }
}

extension TextSearchViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = results[indexPath.row]
        APIClient.search(itemId: item.id!) { (result) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                let vc = UIStoryboard(name: "Result", bundle: nil).instantiateInitialViewController() as! ResultViewController
                vc.item = Mapper<FoodDetail>().map(result)
                self.navigationController?.pushViewController(vc, animated: true)
            })
        }
    }
}

extension TextSearchViewController: DZNEmptyDataSetSource {
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "No results")
    }
}

extension TextSearchViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        APIClient.search(keyword: searchText) { (items) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                var results = [SearchItem]()
                if let items = items {
                    for item in items {
                        if let result = item["fields"] as? [String: AnyObject] {
                            if let result = Mapper<SearchItem>().map(result) {
                                results.append(result)
                            }
                        }
                    }
                }
                self.results = results
                self.tableView.reloadData()
            })
        }
    }
}