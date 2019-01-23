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
    
    private init(){}
    
    func signInAnonimously(){
        
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            let user = authResult!.user
            print(user.uid)
            
            self.authComplete = true
            self.authDoneCallBack?()
        }
    }
    
}
