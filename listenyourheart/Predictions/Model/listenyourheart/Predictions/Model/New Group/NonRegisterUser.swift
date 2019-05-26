//
//  NonRegisterUser.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/20/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class NonRegisterUser: BehaviorUser{
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    
    func loadInterractiveScreen() {
        print("NonRegisterUser")
    }
}
