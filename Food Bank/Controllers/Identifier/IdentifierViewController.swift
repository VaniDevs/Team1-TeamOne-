//
//  IdentifierViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import MTBBarcodeScanner

class IdentifierViewController: UIViewController {

    var scanner: MTBBarcodeScanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scanner = MTBBarcodeScanner(previewView: view)

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        scanner.startScanningWithResultBlock { (results) -> Void in
            
            let codes = results as? [AVMetadataMachineReadableCodeObject]
            if let codes = codes {
                if let product = codes.first {
                    self.scanner.stopScanning()
                    APIClient.search(barcode: product.stringValue, result: { result in
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            if let result = result {
                                print(result)
                                let vc = UIStoryboard(name: "Result", bundle: nil).instantiateInitialViewController() as! ResultViewController
                                vc.result = result
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                            else {
                                self.scanner.startScanning()
                            }
                        })
                    })
                    
                }
                
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        scanner.stopScanning()
    }
}
