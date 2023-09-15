//
//  NavigationBar.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 14/09/23.
//

import UIKit

public class NavigationBar {
    
    class func setLargeTitle(with text: String, in viewController: UIViewController) {
        viewController.navigationItem.title = text
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
