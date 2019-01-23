//
//  WelcomNavigationController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class WelcomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delete button name from backBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
   


}
