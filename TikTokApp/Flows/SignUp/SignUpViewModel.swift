//
//  SignUpViewModel.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 15/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class SignUpViewModel {
    
    func createNewAccount(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, err in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            if let auth = authResult {
                print(auth.user.email!)
                
                let dictUser: Dictionary<String, Any> = [
                    "uid": auth.user.uid,
                    "email": auth.user.email ?? "",
                    "profileImageUrl": "",
                    "status": ""
                ]
                
                Database.database().reference().child("users").child(auth.user.uid).updateChildValues(dictUser) { err, ref in
                    if err != nil {
                        print("Done")
                    }
                }
            }
        }
    }
}
