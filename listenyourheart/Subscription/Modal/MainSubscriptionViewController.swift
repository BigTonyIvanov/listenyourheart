//
//  MainSubscriptionViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/28/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class MainSubscriptionViewController: UIViewController, Storyboardable, ViewSpecificController {
    typealias RootView = MainSubscriptionView
    
    
    public func embedController(_ controller: UIViewController) {
        insertFullframeChildController(controller, index: 0)
    }
    
    public override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - Actions
extension MainSubscriptionViewController {
    @IBAction private func closeDidPress(_ sender: Any) {
        print("Pressed button tuped")
        dismiss(animated: true)
    }

}

extension UIViewController {
    func wrapInModalContainer() -> MainSubscriptionViewController {
        let modalController = MainSubscriptionViewController.instantiateInitialFromStoryboard()
        modalController.embedController(self)
        return modalController
    }
}
