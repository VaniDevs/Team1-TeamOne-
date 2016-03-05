//
//  CircularImageView.swift
//  Food Bank
//
//  Created by Dominic Kuang on 03/05/16.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit


class CircularImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.grayColor().CGColor
    }
}