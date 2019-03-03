//
//  AddConstraintsToUIView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 3/2/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

extension UIView {
    func pinToBounds(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
}
