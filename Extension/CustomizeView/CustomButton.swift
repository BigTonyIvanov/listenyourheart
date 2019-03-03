//
//  CustomButton.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/24/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 23 {
        didSet{
            refreshCorners(value: cornerRadius)
        }
    }
    
    @IBInspectable var heightButton: CGFloat = 44 {
        didSet{
            refreshHeight(value: heightButton)
        }
    }
    
    @IBInspectable var bgColorButton: UIColor = UIColor.red {
        didSet{
            refreshBGColor(value: bgColorButton)
        }
    }
    
    @IBInspectable var customTintColor: UIColor = UIColor.white {
        didSet{
            refreshTintColor(value: customTintColor)
        }
    }
    
    private var customFont: UIFont = UIFont(name: "Helvetica", size: 20)! {
        didSet{
            refreshFont(font: customFont)
        }
    }
 
    
    
    
    
    // for programmatically created buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    // for Storyboard/.xib created buttons
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    // default method which is called within the Storyboard editor
    // itself for rendering @IBDesignable controls
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    private func sharedInit() {
        refreshCorners(value: cornerRadius)
        refreshHeight(value: heightButton)
        refreshBGColor(value: bgColorButton)
        refreshTintColor(value: customTintColor)
        refreshFont(font: customFont)
    }
    
    private func refreshCorners(value: CGFloat){
        self.layer.cornerRadius = value
    }
    
    private func refreshHeight(value: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: value).isActive = true
    }
    
    private func refreshBGColor(value: UIColor) {
        self.backgroundColor = value
    }
    
    private func refreshTintColor(value: UIColor) {
        self.tintColor = value
    }
    
    private func refreshFont(font: UIFont) {
        self.titleLabel?.font = font
    }
    
    
}
