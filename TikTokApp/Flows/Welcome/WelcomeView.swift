//
//  WelcomeView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

class WelcomeView: UIViewController {

    @IBOutlet weak var signUpEmailButton: UIButton!
    @IBOutlet weak var loginFacebookButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var loginEmailButton: UIButton!
    
    let viewModel = WelcomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        signUpEmailButton.addCornerRadius(18)
        loginFacebookButton.addCornerRadius(18)
        loginGoogleButton.addCornerRadius(18)
        loginEmailButton.addCornerRadius(18)
    }

    @IBAction func signUpEmailDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignUpView(), id: .signUpView)
    }
    
    @IBAction func loginFbDidTapped(_ sender: Any) {
        viewModel.startSocialLogin(for: .facebook)
    }
    
    @IBAction func loginGoogleDidTapped(_ sender: Any) {
        viewModel.startSocialLogin(for: .google)
    }
    
    @IBAction func loginEmailDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignUpView(), id: .signUpView)
    }

    @IBAction func termOfUseDidTapped(_ sender: Any) {
    }
}


