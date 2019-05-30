//
//  UIColor.swift
//  GravitySliderExample
//
//  Created by Artem Tevosyan on 9/27/17.
//  Copyright © 2017 Artem Tevosyan. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    class var lightGrayColor: UIColor {
        return UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    
    class var backGrayColor: UIColor {
        return UIColor.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
    class var imageColor: UIColor {
        return UIColor.init(hex: "#6A676C")
    }
    
    class var shadowViewColor: UIColor {
        return UIColor.init(hex: "#CECBCB")
    }
}
