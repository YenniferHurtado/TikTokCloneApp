//
//  UIView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

extension UIView {
    
    public func addCornerRadius(_ radius: CGFloat = 4) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    public func addBorder(_ width: CGFloat = 1, color: CGColor) {
        layer.borderWidth = width
        layer.borderColor = color
        clipsToBounds = true
    }
}
