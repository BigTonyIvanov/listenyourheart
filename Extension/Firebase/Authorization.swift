//
//  Authorization.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import FirebaseAuth

class Authorization{
    
    static let sharedInstance = Authorization()
    
    var authComplete = false
    var userIsRegistered: Bool?
    var completion: (()->Void)?
    var currentUser: UserProfile?
   
    private init(){}
    
    func signInAnonimously(completion: @escaping (_ user: AuthDataResult?)->()){
        
        Auth.auth().signInAnonymously { [weak self] (authResult, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            self!.authComplete = true
            completion(authResult)

        }
    }
    
    func checkRegistration(){

        self.signInAnonimously { (authData) in
            
            let uid = authData?.user.uid
            
            FirebaseData.sharedInstanse.getUserData(byID: uid!, completion: { [weak self] (user) in
                if let userCurrent = user{
                    self!.currentUser = userCurrent
                    self!.userIsRegistered = true
                }else{
                    self!.userIsRegistered = false
                }
                self?.completion?()
            })
        }
    }
    
    func getUIDCurrentUser() -> String?{
        return Auth.auth().currentUser?.uid
    }
    
    func signOut(){
        
    }
    
    func registration(){
        
    }
    

    
}
