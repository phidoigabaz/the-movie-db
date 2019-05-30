//
//  UICustomViewExtension.swift
//  PamZ
//
//  Created by admin on 11/19/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView {
    
    private var _cornerRadius: CGFloat = 0.0
    private var _shadowRadius: CGFloat = 0.0
    private var _opacity: Float = 0.0
    private var _shadowOffset = CGSize(width: 2, height: 2)
    private var _shadowColor: UIColor?
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            layer.cornerRadius = _cornerRadius
        } get {
            return _cornerRadius
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        set (newValue) {
            _shadowRadius = newValue
            layer.shadowRadius = _shadowRadius
        } get {
            return _shadowRadius
        }
    }
    
    @IBInspectable
    var opacity: Float {
        set (newValue) {
            _opacity = newValue
            layer.shadowOpacity = _opacity
        } get {
            return _opacity
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor {
        set (newValue) {
            _shadowColor = newValue
            layer.shadowColor = _shadowColor?.cgColor
        } get {
            return _shadowColor!
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        set (newValue) {
            _shadowOffset = newValue
            layer.shadowOffset = newValue
        } get {
            return _shadowOffset
        }
    }
}

extension UIView {
    func setRadiusView(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorderView(_ borderWith: CGFloat, _ color: UIColor) {
        self.layer.borderWidth = borderWith
        self.layer.borderColor = color.cgColor
    }
    
    func dropShadowView() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        self.layer.cornerRadius = 10
    }
}
