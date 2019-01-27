//
//  PersonalDataVC.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/24/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class PersonalDataVC: UIViewController, ViewSpecificController {
    typealias RootView = PersonalDataView
    
    private var nameFieldsGo = ""
    private var birthDateGo = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delete button name from backBarButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func pressedTextField(_ sender: UITextField) {
        
        view().layerPressedTextField(sender)
        
        if(sender.tag == 1){
            view().changeIcon(name: "calendarRed.png")
        }
        
    }
    
    // Change color and border textField by pressed
    @IBAction func outFromTextField(_ sender: UITextField)
    {
        view().layerOutFromTextField(sender)
        
        if(sender.tag == 1){
            view().changeIcon(name: "calendarGrey.png")
        }
        view().validationFields()
    }
    

    
    @IBAction func confirmYourData(_ sender: AnyObject){
        self.birthDateGo = view().birthDateTextField.text!
        self.nameFieldsGo = view().nameTextField.text!
        performSegue(withIdentifier: "showPeronalData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! PersonalDataController
//        vc.name = self.nameFieldsGo
//        vc.birthday = self.birthDateGo
    }
    


}

