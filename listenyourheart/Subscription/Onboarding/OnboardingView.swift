//
//  OnboardingView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/19/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class OnboardingView: UIView {
    
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var userAgreementText: UIView!
    
    var supportingViews: [UIView] = [] {
        didSet {
            for view in supportingViews {
                self.stackView.addArrangedSubview(view)
            }
        }
    }
    
    var agreementView: UIView = UIView(){
        didSet {
            self.userAgreementText.addSubview(agreementView)
            self.userAgreementText.pinToBounds(agreementView)
        }
    }
}
