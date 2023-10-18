//
//  SignUpView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit
import PhotosUI

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
    
    var avatar: UIImage? = nil
    
    let viewModel = SignUpViewModel()
    let viewStyler = ViewStyler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationItem.setLargeTitle(with: "Create new Account", in: self)
        customizeUI()
    }
    
    @IBAction func signUpButtonDidTapper(_ sender: Any) {
        captureInputDataFromUser()
        viewModel.createNewAccount()
    }

    func captureInputDataFromUser() {
        viewModel.username = userNameTextField.text
        viewModel.email = emailTextfield.text
        viewModel.password = passwordTextfield.text
        viewModel.profileImage = self.avatar
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
        profileImageView.image = Images.profile_signup.image
        profileImageView.clipsToBounds = true
        profileImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPickVC))
        profileImageView.addGestureRecognizer(tapGesture)
    }
}
