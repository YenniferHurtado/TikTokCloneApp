//
//  Localizable.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 23/10/23.
//

import Foundation

enum Localizable: String {
    
    //MARK: SIGNUP
    case signUp_title
    case signUp_errorAlertUsername
    case signUp_errorAlertEmail
    case signUp_errorAlertPassword
    case signUp_errorAlertImage

    //MARK: SIGNIN
    case signIn_title
    
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + ".\(rawValue)", comment: "")
    }
}
