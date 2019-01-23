//
//  ViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/21/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLoggedIn()
    }
}

extension ViewController{
    
    private func checkLoggedIn(){
        
        if Authorization.sharedInstance.authComplete != true {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Auth", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                
                self.present(loginViewController, animated: true)
                return
            }
        }
    }
}
