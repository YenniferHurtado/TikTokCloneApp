//
//  SignInView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 14/09/23.
//

import UIKit

class SignInView: UIViewController {
    
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
        
    let viewStyler = ViewStyler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationItem.setLargeTitle(with: "Sign In", in: self)
        customizeUI()
    }
}

//MARK: UI
private extension SignInView {
    
    func customizeUI() {
        viewStyler.applyBorderAndCornerRadius(to:
                                                [emailContainerView, passwordContainerView, signInButton],
                                              radius: 20, borderColor: .gray)
        
        viewStyler.applyBorderStyleToTextFields([emailTextfield, passwordTextfield], style: .none)
    }
}
