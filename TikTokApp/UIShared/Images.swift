//
//  Images.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 15/09/23.
//

import UIKit

public enum Images: String {
            
    // MARK: SignUp
    case profile_signup = "profile_signup"

    // MARK: ICONS
    case icNavigationBack = "ic_navigation_back"
    case icMain = "ic_main"

    
    public var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
    public var imageAlwaysTemplate: UIImage? {
        return self.image?.withRenderingMode(.alwaysTemplate)
    }

    public var imageAlwaysOriginal: UIImage? {
        return self.image?.withRenderingMode(.alwaysOriginal)
    }
}
