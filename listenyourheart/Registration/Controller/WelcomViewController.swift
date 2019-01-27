//
//  WelcomViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/21/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit
import Firebase

class WelcomViewController: UIViewController , ViewSpecificController{
    
    typealias RootView = WelcomView
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Authorization.sharedInstance.authComplete {
            
            goNextScreen()
        }else{
        
            Authorization.sharedInstance.signInAnonimously()
            Authorization.sharedInstance.authDoneCallBack = goNextScreen
        }
        
        // delete button name from backBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func goNextScreen(){
        print("Authorization is completed")
    }
    
    
    
    // Hidden Navigation controller
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillAppear(animated)
    }

}


extension WelcomViewController{
    @IBAction func getStrted(){
        print("jsdfhsdkh")
        }
}
