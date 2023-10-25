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
    
    func signUp(with email: String, password: String,
                username: String, imgProfile: UIImage?,
                onSucces: @escaping() -> Void,
                onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { auth, err in
            
            if err != nil {
                onError(err!.localizedDescription)
                return
            }
            
            if let auth = auth {
                
                let dictUser: Dictionary<String, Any> = [
                    UID: auth.user.uid,
                    EMAIL: auth.user.email ?? "",
                    USERNAME: username,
                    PROFILE_IMG_URL: "",
                    STATUS: ""
                ]
                
                guard let imgData = imgProfile?.jpegData(compressionQuality: 0.4) else {
                    return
                }

                let profileStorage = ReferenceDatabase().storageSpecificUser(uid: auth.user.uid)
                
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
            
                self.saveImgProfile(username: username, uid: auth.user.uid, data: imgData,
                                    profileStorage: profileStorage, metadata: metaData, dict: dictUser) {
                    onSucces()
                } onError: {errorMessage in 
                    onError(errorMessage)
                }
            }
        }
    }
    
    func saveImgProfile(username: String, uid: String, data: Data,
                        profileStorage: StorageReference, metadata: StorageMetadata,
                        dict: Dictionary<String,Any>,
                        onSucces: @escaping() -> Void,
                        onError: @escaping(_ errorMessage: String) -> Void) {
        
        profileStorage.putData(data, metadata: metadata) { storageMetaData, error in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            profileStorage.downloadURL { url, error in
                if let metaImageUrl = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges{ error in
                            if let error = error {
                                Alert.showErrorAlert(on: SignUpView(), message: error.localizedDescription)
                            }
                        }
                    }
                    
                    var dictTemp = dict
                    dictTemp["profileImageUrl"] = metaImageUrl
                    ReferenceDatabase().databaseSpecificUser(uid: uid).updateChildValues(dict) { err, ref in
                        if err == nil {
                            onSucces()
                        } else {
                            onError(err!.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}
