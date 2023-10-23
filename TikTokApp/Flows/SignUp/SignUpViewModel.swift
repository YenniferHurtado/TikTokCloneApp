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
    
    func createNewAccount(email: String, password: String, avatar: UIImage) {
                
        Auth.auth().createUser(withEmail: email, password: password) { auth, err in
            
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
                
                let referenceToStorage = Storage.storage().reference(forURL: "gs://tiktokclone-app.appspot.com")
                let refereceToProfileStorage = referenceToStorage.child("profile").child(auth.user.uid)
                guard let avatarData = avatar.jpegData(compressionQuality: 0.4) else { return }

                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
                
                
                refereceToProfileStorage.putData(avatarData, metadata: metaData) { storageMetaData, error in
                    
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    refereceToProfileStorage.downloadURL { url, error in
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
            }
        }
    }
}
