//
//  SignUpViewPicker.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 17/10/23.
//

import Foundation
import PhotosUI

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
