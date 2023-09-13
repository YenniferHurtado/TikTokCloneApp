//
//  UINavigation.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 12/09/23.
//

import UIKit

extension UINavigationController {
    
    func pushViewController(to controller: UIViewController, id: ViewsID) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: id.rawValue)
        self.pushViewController(controller, animated: true)
    }
}
