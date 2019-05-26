//
//  PayUser.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/20/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//
import UIKit

class PayUser: BehaviorRegisterUser {
    var id: String
    var name: String
    var birthDate: String
    var buy: Bool = false
    
    
    
    init(id: String, name: String, birthDate: String) {
        self.id = id
        self.name = name
        self.birthDate = birthDate
    }
    
    
    func loadInterractiveScreen(){

        print("NonPayUser")
    }
}
