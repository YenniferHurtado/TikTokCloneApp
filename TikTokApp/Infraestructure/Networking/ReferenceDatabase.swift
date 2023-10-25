//
//  ReferenceDatabase.swift
//  TikTokApp
//
//  Created by Yennifer Hurtado Arce on 24/10/23.
//

import FirebaseDatabase
import FirebaseStorage

let URL_STORAGE_ROOT = "gs://tiktokclone-app.appspot.com"
let USERS = "users"
let STORAGE_PROFILE = "profile"
let UID = "uid"
let EMAIL = "email"
let USERNAME = "username"
let PROFILE_IMG_URL = "profileImageUrl"
let STATUS = "status"

class ReferenceDatabase {
    
    let databaseRoot = Database.database().reference()
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)
    
    var databaseUsers: DatabaseReference {
        return databaseRoot.child(USERS)
    }
    
    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }
    
    func databaseSpecificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }
    
    func storageSpecificUser(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }
}
