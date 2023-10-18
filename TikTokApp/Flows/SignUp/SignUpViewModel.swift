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
    
    var username: String?
    var email: String?
    var password: String?
    var profileImage: UIImage?
    
    func createNewAccount() {
        
        guard let imageSelected = profileImage else {
            print("Profile image is nil")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else { return }
        
        Auth.auth().createUser(withEmail: self.email ?? "", password: self.password ?? "") { auth, err in
            
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            if let auth = auth {
                
                var dictUser: Dictionary<String, Any> = [
                    "uid": auth.user.uid,
                    "email": auth.user.email ?? "",
                    "profileImageUrl": "",
                    "status": ""
                ]
                
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
