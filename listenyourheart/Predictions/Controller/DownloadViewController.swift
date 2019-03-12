//
//  DownloadViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 3/11/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        downloadRCValues()
        
    }
    
    func downloadRCValues(){
        if RCValues.sharedInstance.fetchComplete == true{
            downloadAuthorisation()
        }
        
        RCValues.sharedInstance.loadingDoneCallback = downloadAuthorisation
    }
    
    func downloadAuthorisation(){
        
        if Authorization.sharedInstance.authComplete == true{
            goToNextScreen()
        }
        
        RCValues.sharedInstance.loadingDoneCallback = goToNextScreen
    }

    func goToNextScreen(){
        if Authorization.sharedInstance.isRegister != true{
            checkLoggedIn()
        }else{
            
            print("---------User is register")
//            if Authorization.sharedInstance.currUser.buy == true{
//                performSegue(withIdentifier: "showPersonalData", sender: self)
//            }else{
//                var requiredSubscription: Int!
//                DispatchQueue.main.async {
//                    requiredSubscription = RCValues.sharedInstance.int(forKey: .requiredSubscription)
//                }
//
//                if requiredSubscription == 0{
//                    let contentController = SubscriptionViewController.instantiateInitialFromStoryboard()
//                    // Здесь можно настроить контроллер
//
//                    let onboardingController = OnboardingViewController.instantiateInitialFromStoryboard()
//                    onboardingController.embedController(contentController,
//                                                         actionsDatasource: contentController)
//
//                    let modalController = onboardingController.wrapInModalContainer()
//
//                    self.present(modalController, animated: true)
//                }
//
//            }
            
        }
    }

}


extension DownloadViewController{
    
    private func checkLoggedIn(){
        
        if Authorization.sharedInstance.authComplete != true {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Auth", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "WelcomNavigationController") as! WelcomNavigationController
                
                self.present(loginViewController, animated: true)
                return
            }
        }
    }
}
