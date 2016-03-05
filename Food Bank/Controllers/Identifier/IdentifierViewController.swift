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
        scanner.resultBlock = { result in
            let vc = ResultViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        scanner.startScanning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        scanner.stopScanning()
    }
}
