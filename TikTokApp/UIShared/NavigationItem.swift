//
//  NavigationBar.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 14/09/23.
//

import UIKit

public class NavigationItem {
    
    class func setLargeTitle(with text: String, in viewController: UIViewController) {
        viewController.navigationItem.title = text
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
    }

    class func setIconBackButton() {
        UINavigationBar.appearance().tintColor = .backgroundBarAppearance
        let backImage = Images.icNavigationBack.image
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(.init(horizontal: -1000, vertical: 0), for: .default)
    }
}
