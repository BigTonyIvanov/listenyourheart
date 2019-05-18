//
//  LuckyLuckViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 4/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//


import UIKit
import Firebase

class LuckyLuckViewController: UIViewController, ViewSpecificController {
    
    typealias RootView = LuckyLuckView

    var slides:[SliderPredictions] = [];

    @IBAction func pressedSegmentedControl(_ sender: UISegmentedControl) {
        
        view().chaneSelectedPage(to: sender.selectedSegmentIndex)
    }
    
    
    @IBAction func checkSubscribe(_ sender: Any) {
        
            let contentController = SubscriptionViewController.instantiateInitialFromStoryboard()
            
            // Здесь можно настроить контроллер
            
            let onboardingController = OnboardingViewController.instantiateInitialFromStoryboard()
            onboardingController.embedController(contentController,
                                                 actionsDatasource: contentController)
            
            let modalController = onboardingController.wrapInModalContainer()
            
            self.present(modalController, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
