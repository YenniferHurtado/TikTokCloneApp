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
    
    let pickerImage: UIImage? = nil
    
    func createNewAccount(email: String, password: String) {
        
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
                
                guard let pickerImage = self.pickerImage else {
                    Alert.showErrorAlert(on: SignUpView(), message: "Ingresar avatar")
                    return
                }
                
                let referenceToStorage = Storage.storage().reference(forURL: "gs://tiktokclone-app.appspot.com")
                let refereceToProfileStorage = referenceToStorage.child("profile").child(auth.user.uid)
                guard let avatarData = pickerImage.jpegData(compressionQuality: 0.4) else { return }

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
