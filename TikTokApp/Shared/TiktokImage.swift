//
//  TiktokImage.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 15/09/23.
//

import UIKit

public enum TiktokImage: String {
            
    // MARK: SignUp
    case profileImage = "profile_image"

    // MARK: ICONS
    case icNavigationBack = "ic_navigation_back"
    case icTikTokMain = "ic_tiktok_main"

    
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
