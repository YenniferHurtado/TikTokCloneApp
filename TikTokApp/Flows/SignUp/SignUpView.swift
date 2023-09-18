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
        customizeUIView()
    }
    
    @IBAction func signUpButtonDidTapper(_ sender: Any) {
        
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
        
        viewModel.createNewAccount(with: email, and: password)
    }
    
}

//MARK: UI CUSTOMIZE
private extension SignUpView {
    
    func customizeUIView() {
                
        Border.applyBorderAndCornerRadius(to: [usernameContainerView,
                                               emailContainerView,
                                               passwordContainerView,
                                               signUpButton], radius: 20, borderColor: .borderGray)
        
        Border.applyBorderStyleToTextFields( [userNameTextField,
                                              emailTextfield,
                                              passwordTextfield], style: .none)
        
        customizeProfileImageView()
    }
    
    
    
    func customizeProfileImageView() {
        profileImageView.applyCornerRadius(60)
        profileImageView.image = TiktokImage.profileImage.image
        profileImageView.clipsToBounds = true
        profileImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(presentPickVC))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func presentPickVC() {
        
    }
    
}
