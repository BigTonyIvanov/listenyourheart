//
//  LoginViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/21/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if Authorization.sharedInstance.authComplete {
            
            goNextScreen()
        }else{
        
            Authorization.sharedInstance.signInAnonimously()
            Authorization.sharedInstance.authDoneCallBack = goNextScreen
        }
        
    }
    
    func goNextScreen(){
        print("Authorization is completed")
    }

}
