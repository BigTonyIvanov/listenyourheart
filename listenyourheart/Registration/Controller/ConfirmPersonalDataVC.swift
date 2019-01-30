//
//  ConfirmPersonalDataVC.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/27/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class ConfirmPersonalDataVC: UIViewController, ViewSpecificController {
    
 typealias RootView = ConfirmPersonalDataView
    
    var name = ""
    var birthday = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view().nameLabel.text = " " + self.name + " "
        view().birthDateLabel.text = " " + self.birthday + " "

    }


}
