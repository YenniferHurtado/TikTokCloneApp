//
//  SignUpView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit
import PhotosUI

enum UserInputType {
    case username, password, email
}

class SignUpView: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
        
    let viewModel = SignUpViewModel()
    let viewStyler = ViewStyler()
    var avatar: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationItem.setLargeTitle(with: Localizable.signUp_title.localized, in: self)
        customizeUI()
        customizeProfileImageView()
    }
    
    @IBAction func signUpButtonDidTapper(_ sender: Any) {
        submitRegistrationForm()
    }
}

//MARK: FUNCTIONS
private extension SignUpView {
    
    func submitRegistrationForm() {
        
        let username = checkEmpty(textfield: userNameTextField, type: .username)
        let email = checkEmpty(textfield: emailTextfield, type: .email)
        let password = checkEmpty(textfield: passwordTextfield, type: .password)

        if let username, let email, let password {
            
            guard let avatar = self.avatar else {
                Alert.showErrorAlert(on: self, message: Localizable.signUp_errorAlertImage.localized)
                return
            }
            
            viewModel.createNewAccount(email: email, password: password, username: username, avatar: avatar)
        }
    }
    
    func checkEmpty(textfield: UITextField, type: UserInputType) -> String? {
        if let texfield = textfield.text, texfield.isEmpty {
            showErrorMessage(type: type)
        }
        
        return textfield.text
    }
    
    func showErrorMessage(type: UserInputType) {
        switch type {
        case .username:
            Alert.showErrorAlert(on: self, message: Localizable.signUp_errorAlertUsername.localized)
        case .email:
            Alert.showErrorAlert(on: self, message: Localizable.signUp_errorAlertEmail.localized)
        case .password:
            Alert.showErrorAlert(on: self, message: Localizable.signUp_errorAlertPassword.localized)
        }
    }
}



//MARK: UI CUSTOMIZE
private extension SignUpView {
    
    func customizeUI() {
        viewStyler.applyBorderAndCornerRadius(to: [usernameContainerView, emailContainerView, passwordContainerView, signUpButton],
                                              radius: 20, borderColor: .gray)
        
        viewStyler.applyBorderStyleToTextFields([userNameTextField, emailTextfield, passwordTextfield], style: .none)
    }
    
    func customizeProfileImageView() {
        profileImageView.applyCornerRadius(60)
        profileImageView.applyBorderStyle(2, color: .gray)
        profileImageView.clipsToBounds = true
        profileImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPickVC))
        profileImageView.addGestureRecognizer(tapGesture)
    }
}
