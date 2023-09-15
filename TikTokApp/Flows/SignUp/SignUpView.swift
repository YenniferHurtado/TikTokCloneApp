//
//  SignUpView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

class SignUpView: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    //MARK: IBOulets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    
    let viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBar.setLargeTitle(with: "Create new Account", in: self)
        setupUI()
    }
    
    @IBAction func signUpButtonDidTapper(_ sender: Any) {
        
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
        
        viewModel.createNewAccount(with: email, and: password)
    }
    
}

//MARK: SIGN UP - UI
private extension SignUpView {
    
    func setupUI() {
        
        profileImageView.image = TiktokImage.profileImage.image
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
