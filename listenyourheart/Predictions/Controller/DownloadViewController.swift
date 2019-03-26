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
        if FirebaseData.sharedInstanse.isCreated != true{
            checkLoggedIn()
        }else{
            
            print("---------User is register")
            if FirebaseData.sharedInstanse.userProfile?.buy == true{
                performSegue(withIdentifier: "showPersonalData", sender: self)
            }else{
                if RCValues.sharedInstance.int(forKey: .requiredSubscription) == 0{
                    let contentController = SubscriptionViewController.instantiateInitialFromStoryboard()
                    // Здесь можно настроить контроллер

                    let onboardingController = OnboardingViewController.instantiateInitialFromStoryboard()
                    onboardingController.embedController(contentController,
                                                         actionsDatasource: contentController)

                    let modalController = onboardingController.wrapInModalContainer()

                    self.present(modalController, animated: true)
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
