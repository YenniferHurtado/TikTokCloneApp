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
        NavigationItem.setLargeTitle(with: "Create new Account", in: self)
        customizeUI()
    }
    
    @IBAction func signUpButtonDidTapper(_ sender: Any) {
        submitRegistrationForm()
    }
}

//MARK: FUNCTIONS
private extension SignUpView {
    
    func submitRegistrationForm() {
        if let _ = checkEmptyTextField(userNameTextField, type: .username),
           let email = checkEmptyTextField(emailTextfield, type: .email),
           let password = checkEmptyTextField(passwordTextfield, type: .password) {
            
            viewModel.createNewAccount(email: email, password: password)
            self.avatar = viewModel.pickerImage
        }
    }
    
    func checkEmptyTextField(_ textfield: UITextField, type: UserInputType) -> String? {
        if let texfield = textfield.text, texfield.isEmpty {
            showErrorMessage(type: type)
        }
        
        return textfield.text
    }
    
    func showErrorMessage(type: UserInputType) {
        switch type {
        case .username:
            Alert.showErrorAlert(on: self, message: "Ingresa un username")
        case .email:
            Alert.showErrorAlert(on: self, message: "Ingresa un email")
        case .password:
            Alert.showErrorAlert(on: self, message: "Ingresa un password")
        }
    }
}



//MARK: UI CUSTOMIZE
private extension SignUpView {
    
    func customizeUI() {
        customizeProfileImageView()
        viewStyler.applyBorderAndCornerRadius(to:
                                                [usernameContainerView, emailContainerView, passwordContainerView, signUpButton],
                                              radius: 20, borderColor: .gray)
        viewStyler.applyBorderStyleToTextFields([userNameTextField, emailTextfield, passwordTextfield], style: .none)
    }
    
    func customizeProfileImageView() {
        profileImageView.applyCornerRadius(60)
        profileImageView.applyBorderStyle(2, color: CGC)
        profileImageView.image = Images.profile_signup.image
        profileImageView.clipsToBounds = true
        profileImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPickVC))
        profileImageView.addGestureRecognizer(tapGesture)
    }
}
