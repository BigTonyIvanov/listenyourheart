//
//  UserProfile.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/7/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import Foundation

struct UserProfile {
    let name: String?
    let birthDate: String?
    let id: Int?
    var buy: Bool?
    
    init(data: [String: Any]) {
        let id = data["id"] as? Int
        let name = data["name"] as? String
        let birthDate = data["birthDate"] as? String
        let buy = data["buy"] as? Bool
        
        
        self.id = id
        self.name = name
        self.birthDate = birthDate
        
        if let newBuy = buy{
            self.buy = newBuy
        }else{
            self.buy = false
        }
        
    }
}
