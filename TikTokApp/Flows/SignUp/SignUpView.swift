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
        setNavigationBar()
        setupUI()
    }
}

//MARK: SIGN UP - UI
private extension SignUpView {
    
    func setNavigationBar() {
        navigationItem.title = "Create new Account"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupUI() {
        
        addcornerRadius(to: [usernameContainerView,
                             emailContainerView,
                             passwordContainerView,
                             signUpButton], radius: 20)
        addcornerRadius(to: [profileImageView], radius: 60)
        
        addBorderStyle(to: [userNameTextField,
                            emailTextfield,
                            passwordTextfield], style: .none)
        
        func addcornerRadius(to multipleViews: [UIView], radius: CGFloat = 0) {
            multipleViews.forEach { view in
                view.addCornerRadius(radius)
                view.addBorder(color: .borderGray)
            }
        }
        
        func addBorderStyle(to textfields: [UITextField], style: UITextField.BorderStyle) {
            textfields.forEach { textfield in
                textfield.borderStyle = style
            }
        }
    }
    
}
