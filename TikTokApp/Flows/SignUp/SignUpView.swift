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
    
    let viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBar.setLargeTitle(with: "Create new Account", in: self)
        customizeUI()
    }
    
    @IBAction func signUpButtonDidTapper(_ sender: Any) {
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
        viewModel.createNewAccount(with: email, and: password)
    }
    
}

//MARK: UI CUSTOMIZE
private extension SignUpView {
    
    func customizeUI() {
        customizeProfileImageView()
        Border.applyBorderAndCornerRadius(to: [usernameContainerView,
                                               emailContainerView,
                                               passwordContainerView,
                                               signUpButton], radius: 20, borderColor: .borderGray)
        Border.applyBorderStyleToTextFields( [userNameTextField,
                                              emailTextfield,
                                              passwordTextfield], style: .none)
    }
    
    
    
    func customizeProfileImageView() {
        profileImageView.applyCornerRadius(60)
        profileImageView.image = TiktokImage.profileImage.image
        profileImageView.clipsToBounds = true
        profileImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(presentPickVC))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
}

extension SignUpView: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        for item in results {
            item.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let imageSelected = image as? UIImage {
                    DispatchQueue.main.sync {
                        self.profileImageView.image = imageSelected
                    }
                }
            }
        }
        dismiss(animated: true)
    }
    
    
    @objc func presentPickVC() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true)
    }
}
