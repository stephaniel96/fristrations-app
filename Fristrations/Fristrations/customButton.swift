//
//  customButton.swift
//  Fristrations
//
//  Created by Kevin Bradicich on 4/25/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//
import UIKit
@IBDesignable


class CustomButton: UIButton {
    // means you can edit it from storyboard
    @IBInspectable var fillColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var isFacebook: Bool = false
    @IBInspectable var isWebsite: Bool = false
    
    override func drawRect(rect: CGRect) {
        if (isFacebook) {
            let circleShape = UIBezierPath(ovalInRect: rect)
            
            fillColor.setFill() // for setting inside
            circleShape.fill() // could also do circlePath.stroke()
            
        }
        else if (isWebsite) {
            let circleShape = UIBezierPath(ovalInRect: rect)
            
            fillColor.setFill() // for setting inside
            circleShape.fill() // could also do circlePath.stroke()
            
        }
    }
}
