//
//  SignUpViewModel.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 15/09/23.
//

import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewModel {
    
    func createNewAccount(with email: String, and password: String, imageData: UIImage?) {
        
        guard let imageData = imageData else {
            print("Profile image is nil")
            return
        }
        
        guard let imageData = imageData.jpegData(compressionQuality: 0.4) else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, err in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            if let auth = authResult {
                print(auth.user.email!)
                
                var dictUser: Dictionary<String, Any> = [
                    "uid": auth.user.uid,
                    "email": auth.user.email ?? "",
                    "profileImageUrl": "",
                    "status": ""
                ]
                
                //Storage
                let storageRef = Storage.storage().reference(forURL: "gs://tiktokclone-app.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(auth.user.uid)
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metaData) { storageMetaData, error in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    storageProfileRef.downloadURL { url, error in
                        if let metaImageUrl = url?.absoluteString {
                            dictUser["profileImageUrl"] = metaImageUrl
                            Database.database().reference().child("users").child(auth.user.uid).updateChildValues(dictUser) { err, ref in
                                if err != nil {
                                    print("Done")
                                }
                            }
                        }
                    }
                }
                
                Database.database().reference().child("users").child(auth.user.uid).updateChildValues(dictUser) { err, ref in
                    if err != nil {
                        print("Done")
                    }
                }
            }
        }
    }
}
