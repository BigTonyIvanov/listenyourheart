//
//  ViewSpecificController.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

protocol ViewSpecificController {
    associatedtype RootView: UIView

}

extension ViewSpecificController where Self: UIViewController{
    func view() -> RootView{
        return self.view as! RootView
    }
}
