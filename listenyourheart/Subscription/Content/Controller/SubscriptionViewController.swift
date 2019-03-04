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
    
    // Container view добавляет констрейнты на основе Autoresizing mask, а они конфликтуют с
    // внутренними размерами контента. Проблема решается в коде: в контроллере-контенте нужно
    // указать, что на него не влияют констрейнты из Autoresizing mask:
    override func loadView() {
        super.loadView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    @IBAction func doneButtonDidPress(_ sender: Any) {
        dismiss(animated: true)
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