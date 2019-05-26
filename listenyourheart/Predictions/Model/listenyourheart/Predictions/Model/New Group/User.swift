//
//  User.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/20/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

class User{
    
    private var userBehavior: BehaviorUser!
    
    init(userBehavior: BehaviorUser) {
        self.userBehavior = userBehavior
    }
    
    func performUser(){
        self.userBehavior.loadInterractiveScreen()
    }
    
    func setUserBehavior(user: BehaviorUser){
        self.userBehavior = user
    }
    
}
