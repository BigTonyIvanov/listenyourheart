//
//  SubscriptionView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 2/19/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class SubscriptionView: UIView{
    // MARK: - Public
    var image: UIImage? {
        didSet { imageView.image = image }
    }
    
    var title: String? {
        didSet { titleLabel.text = title }
    }
    
    // MARK: - Images
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Text
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
}
