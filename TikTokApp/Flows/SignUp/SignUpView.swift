//
//  SignUpView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit
import PhotosUI

enum UserInputType {
    case username, password, email, avatar
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
    var imgProfile: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationItem.setLargeTitle(with: Localizable.signUp_title.localized, in: self)
        customizeUI()
    }
    
    @IBAction func signUpButtonDidTapper(_ sender: Any) {
        submitRegistrationForm()
    }
}

//MARK: FUNCTIONS
private extension SignUpView {
    
    func submitRegistrationForm() {

        let username = validateTextfield(userNameTextField, type: .username)
        let email = validateTextfield(emailTextfield, type: .email)
        let password = validateTextfield(passwordTextfield, type: .password)
        
        if let username, let email, let password {
            guard let imgProfile = self.imgProfile else {
                showErrorMessage(type: .avatar)
                return
            }
            
            view.indicatorStartAnimating()
            
            viewModel.signUp(with: email, password: password, username: username, imgProfile: imgProfile) { [view] in
                view?.indicatorStopAnimating()
                Alert.showErrorAlert(on: self, message: "EXITOSO")
                //GO YO ANOTHER VIEW
            } onError: { errorMessage in
                Alert.showErrorAlert(on: self, message: errorMessage)
            }
        }
    }
    
    func validateTextfield(_ textfield: UITextField, type: UserInputType) -> String? {
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
        case .avatar:
            Alert.showErrorAlert(on: self, message: Localizable.signUp_errorAlertImage.localized)
        }
    }
}



//MARK: UI CUSTOMIZE
private extension SignUpView {
    
    func customizeUI() {
        viewStyler.applyBorderAndCornerRadius(to: [usernameContainerView, emailContainerView,
                                                   passwordContainerView, signUpButton],
                                              radius: 20, borderColor: .gray)
        viewStyler.applyBorderStyleToTextFields([userNameTextField, emailTextfield,
                                                 passwordTextfield], style: .none)
        customizeProfileImageView()
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
