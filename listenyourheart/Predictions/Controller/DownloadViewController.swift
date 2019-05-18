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
        
        if RCValues.sharedInstance.fetchComplete{
            startApp()
        }
        
        RCValues.sharedInstance.loadingDoneCallback = startApp
    }
    
    private func startApp(){
        let uid = Authorization.sharedInstance.getUIDCurrentUser()
        
        if let userUID = uid{
            chooseScreen(for: userUID)
        }else{
            Authorization.sharedInstance.signInAnonimously { [weak self](authData) in
                if let currentUser = authData?.user{
                    self?.chooseScreen(for: currentUser.uid)
                }
            }
        }
    }
   
    private func chooseScreen(for uid: String){
        FirebaseData.sharedInstanse.getUserData(byID: uid) { (currentUser) in
            if let currentUser = currentUser{
                self.showDataScreen(user: currentUser)
            }else{
                self.checkLoggedIn()
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
    
    private func showDataScreen(user: UserProfile){
        if let isBuying = user.buy, isBuying{
            performSegue(withIdentifier: "showPersonalData", sender: self)
        }else{

            let needBuying = RCValues.sharedInstance.bool(forKey: .requiredSubscription)
            if needBuying == true{
                openSibscribeScreen()
            }else{
                performSegue(withIdentifier: "showPersonalData", sender: self)
            }
        }
    }
    
    private func openSibscribeScreen(){
        let contentController = SubscriptionViewController.instantiateInitialFromStoryboard()
        let onboardingController = OnboardingViewController.instantiateInitialFromStoryboard()
        onboardingController.embedController(contentController,
                                             actionsDatasource: contentController)
        
        let modalController = onboardingController.wrapInModalContainer()
        modalController.view().closeButton.isHidden = true
        
        self.present(modalController, animated: true)    }
  
}
