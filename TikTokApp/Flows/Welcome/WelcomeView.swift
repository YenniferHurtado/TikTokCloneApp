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
        Border.addcornerRadius(to: [signUpEmailButton,
                                    loginFacebookButton,
                                    loginGoogleButton,
                                    loginEmailButton], radius: 18)
    }

    @IBAction func signUpEmailDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignUpView(), id: .signUpView)
    }
}


