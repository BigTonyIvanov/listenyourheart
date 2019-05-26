//
//  BehaviorUser.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/20/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit
protocol BehaviorUser {
    
    var id: String { get set }
    func loadInterractiveScreen()
}
