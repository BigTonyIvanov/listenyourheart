//
//  DownloadViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 3/11/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit
import FirebaseAuth

class DownloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let loader = PreloadData()
        loader.loadData {
            self.goToNextScreen()
        }
        
        
    }
    

    func goToNextScreen(){

        if FirebaseData.sharedInstanse.isCreated == false{
            checkLoggedIn()
        }else{
            
            print("--- User is register")
            let isBuying = FirebaseData.sharedInstanse.userProfile?.buy
            if isBuying == true{
                performSegue(withIdentifier: "showPersonalData", sender: self)
            }else{
                let needBuying = RCValues.sharedInstance.bool(forKey: .requiredSubscription)
                if needBuying == true{
                    let contentController = SubscriptionViewController.instantiateInitialFromStoryboard()
                    
                    // Здесь можно настроить контроллер

                    let onboardingController = OnboardingViewController.instantiateInitialFromStoryboard()
                    onboardingController.embedController(contentController,
                                                         actionsDatasource: contentController)

                    let modalController = onboardingController.wrapInModalContainer()

                    self.present(modalController, animated: true)
                }else{
                    performSegue(withIdentifier: "pampam", sender: self)
                }
     

            }
            
        }
    }

}


extension DownloadViewController{
    
    private func checkLoggedIn(){

                let storyboard = UIStoryboard(name: "Auth", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "WelcomNavigationController") as! WelcomNavigationController
                
                self.present(loginViewController, animated: true)
    }
  
}
