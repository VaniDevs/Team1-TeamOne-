//
//  DonateViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import KLCPopup

class DonateViewController: UIViewController {

    @IBOutlet var popupView: UIView!
    
    let donateURL = "http://gvfbs.convio.net/donate"
    let donatePhoneNumber = "6042162329"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCoupon(sender: UIButton) {
        
        let view = NSBundle.mainBundle().loadNibNamed("CouponView", owner: self, options: nil)[0] as! UIView
        view.layer.cornerRadius = 4
        
        let mainWindow = UIApplication.sharedApplication().keyWindow
        view.frame = CGRectMake(0, 0, mainWindow!.frame.size.width - 20, 270)
        
        let popup = KLCPopup(contentView: view, showType: .SlideInFromTop, dismissType: .SlideOutToBottom, maskType: .Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        
        popup.show()
    }

    @IBAction func showOnlineDonate(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: donateURL)!)
    }
    
    @IBAction func donateOverPhone(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + donatePhoneNumber)!)
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
