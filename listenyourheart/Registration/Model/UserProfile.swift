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
    let id: Int? = nil
    var buy: Bool?
    
    init(data: [String: Any]) {
        //let id = data["id"] as? Int
        let name = data["name"] as? String
        let birthDate = data["birthDate"] as? String
        let buy = NSString(string:(data["buy"] as?  String)!).boolValue
        
        
//        self.id = id
        self.name = name
        self.birthDate = birthDate
        self.buy = buy
        
    }
}
