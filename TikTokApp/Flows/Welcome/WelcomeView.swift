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
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupUI() {
        Border.addcornerRadius(to: [signUpEmailButton,
                                    loginFacebookButton,
                                    loginGoogleButton,
                                    loginEmailButton], radius: 18)
        iconTiktokMain.image = TiktokImage.icTikTokMain.image
        
    }

    @IBAction func signUpEmailDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignUpView(), id: .signUpView)
    }
    @IBAction func loginEmailButtonDidTapped(_ sender: Any) {
        navigationController?.pushViewController(to: SignUpView(), id: .signInView)

    }
}


