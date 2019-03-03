//
//  InsertChildToUiViewController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 3/2/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

extension UIViewController {
    func insertFullframeChildController(_ childController: UIViewController,
                                        toView: UIView? = nil, index: Int) {
        
        let containerView: UIView = toView ?? view
        
        addChild(childController)
        containerView.insertSubview(childController.view, at: index)
        containerView.pinToBounds(childController.view)
        childController.didMove(toParent: self)
    }
}
