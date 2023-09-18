//
//  UIView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

extension UIView {
    
    public func applyCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    public func applyBorderStyle(_ width: CGFloat = 1, color: CGColor) {
        layer.borderWidth = width
        layer.borderColor = color
        clipsToBounds = true
    }
}
