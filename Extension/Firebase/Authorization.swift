//
//  Authorization.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import Foundation
import Firebase

class Authorization{
    static var sharedInstance = Authorization()
    var authDoneCallBack: (() -> Void)?
    var authComplete = false
    var isRegister: Bool = false
    var currUser: UserProfile!
    
    private init(){
        self.signInAnonimously()
    }
    
    func signInAnonimously(){
        
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            let user = authResult!.user
            
            DispatchQueue.main.async {
                
                
                let ref = Database.database().reference()
                ref.child("users").child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    let value = snapshot.value as? [String: Any]
                    self.currUser = UserProfile(data: value!)
                    
                }) { (error) in
                    print(error.localizedDescription)
                }
            }
           
            
            
            self.authComplete = true
            self.authDoneCallBack?()
        
        }
    }
    

    
}
