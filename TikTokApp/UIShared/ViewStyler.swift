//
//  ViewStyler.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 14/09/23.
//

import UIKit

public class ViewStyler {
    
    func applyBorderAndCornerRadius(to views : [UIView], radius: CGFloat, borderColor: CGColor) {
        views.forEach { view in
            view.applyBorderStyle(color: borderColor)
            view.applyCornerRadius(radius)
        } 
    }
    
    func applyBorderStyleToTextFields(_ arrayTextfields: [UITextField], style: UITextField.BorderStyle) {
        arrayTextfields.forEach { textfield in
            textfield.borderStyle = style
        }
    }
}
