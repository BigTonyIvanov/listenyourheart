//
//  FirebaseData.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/7/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import FirebaseAuth
import FirebaseDatabase
import FirebaseRemoteConfig

class FirebaseData{
    
    static let sharedInstanse = FirebaseData()
    
    var ref: DatabaseReference!
    var isCreated: Bool = false
    
    var loadingDoneCallback: (() -> Void)?
    var fetchComplete = false
    
    private init(){
    }
    
    func saveIntoFirebase(for uid: String?, userData: [String: Any]){

        guard let currUid = uid else {return}
        Database.database().reference(withPath: "users").child(currUid).updateChildValues(userData) { (error, _) in

            if let error = error {
                print(error)
                return
            }
            print("--- Successfully saved user into firebase database")
        }
    }
    
    
    func getUserData(byID uid: String, completion: @escaping (_ user: UserProfile?)->()){

        self.ref = Database.database().reference()
        self.ref.child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in

            // Get user value
            let dictionaryData = snapshot.value as? [String: Any]
            
            guard let userData = dictionaryData else{
                
                completion(nil)
                return
            }
            
           completion(UserProfile(data: userData))
            
        }) { (error) in
            print("--- Error" + error.localizedDescription)
        }
    }
    
    
    
    
}
