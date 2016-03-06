//
//  RoundedButton.swift
//  Food Bank
//
//  Created by Dominic Kuang on 03/05/16.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 2 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
