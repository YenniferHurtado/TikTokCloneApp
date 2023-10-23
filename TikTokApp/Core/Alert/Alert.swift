//
//  Alert.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 18/10/23.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: UIViewController,
                                       with title: String,
                                       message: String,
                                       handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title, style: .default, handler: handler))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    static func showErrorAlert(on vc: UIViewController,
                               message: String,
                               handler: ((UIAlertAction) -> Void)? = nil) {
        showBasicAlert(on: vc, with: "Error",
                       message: message, handler: handler)
    }
    
    static func showEmptyAlert(on vc: UIViewController, handler: ((UIAlertAction) -> Void)? = nil) {
        showBasicAlert(on: vc, with: "Localizable.HomeView.alertTitle.localized",
                       message: "Localizable.HomeView.emptyResult.localized", handler: handler)
    }

}
