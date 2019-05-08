//
//  SubscriptionViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/19/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class SubscriptionViewController: UIViewController, ViewSpecificController, Storyboardable {
    typealias RootView = SubscriptionView
    
    // Container view add constraints based on Autoresizing mask, but they conflict with
    // internal size of content. The problem solve in code: in Content Controller need
    // say,that constraints from Autoresizing mask influence on it
    override func loadView() {
        super.loadView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    @IBAction func doneButtonDidPress(_ sender: Any) {
        let alert = UIAlertController(title: "Notification", message: "Ooo, you are lucky! \n Today it`s free for you", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SubscriptionViewController: OnboardingViewControllerDatasource {
    var agreementView: UIView {
        return view().policyPrivacy
    }
    
    var supportingViews: [UIView] {
        return [view().doneButton]
    }
}
