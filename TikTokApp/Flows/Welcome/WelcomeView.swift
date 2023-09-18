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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func customizeUI() {
        
        iconTiktokMain.image = TiktokImage.icTikTokMain.image
        Border.applyBorderAndCornerRadius(to: [signUpEmailButton,
                                               loginFacebookButton,
                                               loginGoogleButton,
                                               loginEmailButton], radius: 20, borderColor: .borderGray)
    }

    @IBAction func signUpEmailDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignUpView(), id: .signUpView)
    }
    @IBAction func loginEmailButtonDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignInView(), id: .signInView)

    }
}


