//
//  OnboardingViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/19/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerDatasource {
    var supportingViews: [UIView] { get }
}

class OnboardingViewController: UIViewController, Storyboardable, ViewSpecificController {
    typealias RootView = OnboardingView
    
    public func embedController(_ controller: UIViewController,
                                actionsDatasource: OnboardingViewControllerDatasource) {
        
        insertFullframeChildController(controller,
                                       toView: view().contentContainerView,
                                       index: 0)
        view().supportingViews = actionsDatasource.supportingViews
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let buttonsDatasource  = segue.destination as? OnboardingViewControllerDatasource {
            view().supportingViews = buttonsDatasource.supportingViews
        }
    }
}
