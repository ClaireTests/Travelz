//
//  UIView+Style.swift
//  Travelz
//
//  Created by claire.roughan on 26/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import UIKit

extension UIView {

    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = false
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.clipsToBounds = true
    }
}
