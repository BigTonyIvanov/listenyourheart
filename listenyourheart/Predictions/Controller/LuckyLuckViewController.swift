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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        pageControl.numberOfPages = slides.count
//        pageControl.currentPage = 0
        //view.bringSubview(toFront: pageControl)
        
        
    }
}
