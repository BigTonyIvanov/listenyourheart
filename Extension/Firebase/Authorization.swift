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
    
    static let sharedInstance = Authorization()
    
    var authDoneCallBack: (() -> Void)?
    var authComplete = false
    var uid: String?
    
    private init(){}
    
    func signInAnonimously(completion: @escaping ()->()){
        
        Auth.auth().signInAnonymously { [weak self](authResult, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            let user = authResult!.user
            self!.uid = user.uid
            
            completion()
            self!.authComplete = true
            self!.authDoneCallBack?()
        
        }
    }
    

    
}
