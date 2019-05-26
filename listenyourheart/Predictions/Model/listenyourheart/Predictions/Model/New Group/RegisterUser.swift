//
//  RegisterUser.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/20/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

class RegisterUser {

    private var registerUserBehavior: BehaviorRegisterUser!
    
    init(registerUserBehavior: BehaviorRegisterUser) {
        self.registerUserBehavior = registerUserBehavior
    }

    func performRegisterUser(){
        self.registerUserBehavior.loadInterractiveScreen()
    }
    
    func setRegisterUserBehavior(registerUserBehavior: BehaviorRegisterUser){
        self.registerUserBehavior = registerUserBehavior
    }
    
    
}
