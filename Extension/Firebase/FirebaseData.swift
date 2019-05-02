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
    
    var userProfile: UserProfile?
    var ref: DatabaseReference!
    var isCreated: Bool = false
    
    var loadingDoneCallback: (() -> Void)?
    var fetchComplete = false
    
    private init(){
  
    }
    
    func saveIntoFirebase(userData: [String: Any]){
        
        guard let uid = Authorization.sharedInstance.uid else {return}
        
        userProfile = UserProfile(data: userData)
        
        let userData = ["name": userProfile?.name, "birthDate": userProfile?.birthDate, "buy": userProfile?.buy?.description ?? "none"]
        let values = [uid: userData]
        
        Database.database().reference(withPath: "users").updateChildValues(values) { (error, _) in
            
            if let error = error {
                print(error)
                return
            }
            print("--- Successfully saved user into firebase database")
        }
    }
    
    func getUserData(completion: @escaping ()->()){
        
            guard let uid = Auth.auth().currentUser?.uid else {return}
            self.ref = Database.database().reference()
            self.ref.child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                
                // Get user value
                let value = snapshot.value as? [String: Any]
                if value == nil{
                    return
                }
                
                print("--- Print ifo from database", value)
                self.userProfile = UserProfile(data: value!)
                self.isCreated = true
                completion()

            }) { (error) in
                print(error.localizedDescription)
            }
    }
    
    
    
    
}
