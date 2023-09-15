//
//  SignUpView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

class SignUpView: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    //UITextfields
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    //UIView
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    
    //UIButton
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBar.setLargeTitle(with: "Create new Account", in: self)
        setupUI()
    }
}

//MARK: SIGN UP - UI
private extension SignUpView {
    
    func setupUI() {

        Border.addcornerRadius(to: [usernameContainerView,
                                    emailContainerView,
                                    passwordContainerView,
                                    signUpButton], radius: 20)
        
        Border.addcornerRadius(to: [profileImageView], radius: 60)
        
        Border.addBorderStyle(to: [userNameTextField,
                                   emailTextfield,
                                   passwordTextfield], style: .none)
    }
    
}
