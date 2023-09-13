//
//  WelcomeViewModel.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import Foundation
import FBSDKLoginKit

enum SocialLoginType {
    case facebook
    case google
}

class WelcomeViewModel {
    
    func startSocialLogin(for type: SocialLoginType) {
        
        switch type {
        case .facebook:
            loginFacebook()
        case .google:
            loginGoogle()
        }
    }
    
    func loginFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: ["email"], from: nil) { loginManagerLoginResult, error in
            <#code#>
        }
        
        loginManager.logIn(permissions: [.email], from: self) { <#LoginManagerLoginResult?#>, <#Error?#> in
            <#code#>
        }
    }
    
    func loginGoogle() {
        
    }
    
}
