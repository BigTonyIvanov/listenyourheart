//
//  BehaviorRegisterUser.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/20/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//
import UIKit

protocol BehaviorRegisterUser: BehaviorUser {
    
    var name: String{get set}
    var birthDate: String{get set}
    
    func loadInterractiveScreen()
}
