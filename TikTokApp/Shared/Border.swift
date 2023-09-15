//
//  UIView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 14/09/23.
//

import UIKit

public class Border {
    
    class func addcornerRadius(to multipleViews: [UIView], radius: CGFloat = 0) {
        multipleViews.forEach { view in
            view.addCornerRadius(radius)
            view.addBorder(color: .borderGray)
        }
    }
    
    class func addBorderStyle(to textfields: [UITextField], style: UITextField.BorderStyle) {
        textfields.forEach { textfield in
            textfield.borderStyle = style
        }
    }
}
