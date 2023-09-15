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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBar.setLargeTitle(with: "Sign In", in: self)
    }

}

//MARK: SIGN UP - UI
private extension SignUpView {
    
    func setupUI() {
        
    }
    
}
