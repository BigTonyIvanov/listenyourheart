//
//  FirebaseData.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/7/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import FirebaseAuth
import FirebaseDatabase

class FirebaseData{
    
    static let sharedInstanse = FirebaseData()
    private var userProfile: UserProfile?
    
    private init(){
        //  Add Authorisation in the future
        
    }
    
    func saveIntoFirebase(userData: [String: Any]){
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        //let userData = ["name": userName,"email": userEmail]
        
        userProfile = UserProfile(data: userData)
        
        let userData = ["name": userProfile?.name, "birthDate": userProfile?.birthDate]
        let values = [uid: userData]
        
        print(values)
        
        Database.database().reference(withPath: "users").updateChildValues(values) { (error, _) in
            
            if let error = error {
                print(error)
                return
            }
            
            print("Successfully saved user into firebase database")
            //self.openMainViewController()
        }
    }
}
