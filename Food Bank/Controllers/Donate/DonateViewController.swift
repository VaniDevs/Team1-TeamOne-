//
//  DonateViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import KLCPopup
import Braintree

class DonateViewController: UIViewController, BTDropInViewControllerDelegate {

    @IBOutlet weak var amountField: UITextField!
    
    let donateURL = "http://gvfbs.convio.net/donate"
    let donatePhoneNumber = "6042162329"
    
    var braintreeClient = BTAPIClient(authorization: "sandbox_94ntpbmv_g945wnx6z3hzk2yp")!
    
    var paymentPopup: KLCPopup!

    
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
        view.frame = CGRectMake(0, 0, mainWindow!.frame.size.width - 20, 330)
        
        let popup = KLCPopup(contentView: view, showType: .SlideInFromTop, dismissType: .SlideOutToBottom, maskType: .Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        
        popup.show()
    }

    @IBAction func showOnlineDonate(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: donateURL)!)
    }
    
    @IBAction func paypal(sender: UIButton) {
        let view = NSBundle.mainBundle().loadNibNamed("AmountView", owner: self, options: nil)[0] as! UIView
        view.layer.cornerRadius = 4
        
        let mainWindow = UIApplication.sharedApplication().keyWindow
        view.frame = CGRectMake(0, 0, mainWindow!.frame.size.width - 20, 330)
        
        paymentPopup = KLCPopup(contentView: view, showType: .SlideInFromTop, dismissType: .SlideOutToBottom, maskType: .Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        
        amountField.layer.borderColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1).CGColor
        amountField.layer.borderWidth = 1
        amountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        amountField.becomeFirstResponder()
        
        paymentPopup.show()
    }
    
    @IBAction func donateOverPhone(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + donatePhoneNumber)!)
    }
    
    @IBAction func dismissPaymentPopup(sender: AnyObject) {
        paymentPopup.dismiss(true)
    }
    
    @IBAction func tappedMyPayButton() {
        paymentPopup.dismiss(true)
        
        // If you haven't already, create and retain a `BTAPIClient` instance with a
        // tokenization key OR a client token from your server.
        // Typically, you only need to do this once per session.
        // braintreeClient = BTAPIClient(authorization: aClientToken)
        
        // Create a BTDropInViewController
        let dropInViewController = BTDropInViewController(APIClient: braintreeClient)
        dropInViewController.delegate = self
        
        // This is where you might want to customize your view controller (see below)
        
        // The way you present your BTDropInViewController instance is up to you.
        // In this example, we wrap it in a new, modally-presented navigation controller:
        dropInViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Cancel,
            target: self, action: "userDidCancelPayment")
        let navigationController = UINavigationController(rootViewController: dropInViewController)
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func userDidCancelPayment() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dropInViewController(viewController: BTDropInViewController,
         didSucceedWithTokenization paymentMethodNonce: BTPaymentMethodNonce)
    {
        // Send payment method nonce to your server for processing
//        postNonceToServer(paymentMethodNonce.nonce)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dropInViewControllerDidCancel(viewController: BTDropInViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
