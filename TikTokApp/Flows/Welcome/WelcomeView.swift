//
//  WelcomeView.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

class WelcomeView: UIViewController {

    @IBOutlet weak var iconTiktokMain: UIImageView!
    @IBOutlet weak var signUpEmailButton: UIButton!
    @IBOutlet weak var loginFacebookButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var loginEmailButton: UIButton!
    
    let viewModel = WelcomeViewModel()
    let viewStyler = ViewStyler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
    }
    
    func customizeUI() {
        
        iconTiktokMain.image = Images.icMain.image
        viewStyler.applyBorderAndCornerRadius(to:
                                                [signUpEmailButton, loginFacebookButton, loginGoogleButton, loginEmailButton],
                                              radius: 20, borderColor: .gray)
    }

    @IBAction func signUpEmailDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignUpView(), id: .signUpView)
    }
    @IBAction func loginEmailButtonDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignInView(), id: .signInView)
    }
}


