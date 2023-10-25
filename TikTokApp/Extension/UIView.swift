//
//  UIView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

//MARK: CORNER RADIUS
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

//MARK: INDICATOR VIEW
extension UIView {

    func createActivityIndicatorView() -> UIActivityIndicatorView {
        lazy var activityIndicatorView: UIActivityIndicatorView = {
            let indicator = UIActivityIndicatorView()
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.startAnimating()
            indicator.style = .large
            indicator.tag = 1
            return indicator
        }()
        return activityIndicatorView
    }

    func indicatorStartAnimating() {
        let indicatorView = createActivityIndicatorView()
        self.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func indicatorStopAnimating() {
        if let background = viewWithTag(1){
            background.removeFromSuperview()
        }
    }
}
