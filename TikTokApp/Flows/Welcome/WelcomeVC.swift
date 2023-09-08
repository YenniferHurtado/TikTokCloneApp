//
//  WelcomeVC.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 28/08/23.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var signUpEmailButton: UIButton!
    @IBOutlet weak var loginFacebookButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var loginEmailButton: UIButton!
    
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

    @IBAction func signUpDidTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "", bundle: <#T##Bundle?#>)
//        let controller = SigUpViewController()
//        navigationController?.pushViewController(controller, animated: true)
    }
}

