//
//  PersonalDataView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/24/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import Foundation
import UIKit

final class PersonalDataView: UIView, UITextFieldDelegate {
    // Mark: - subviews
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    
    @IBOutlet weak var nextButton: CustomButton!
    lazy private var datePicker: UIDatePicker = {
        // Create DatePicker and add it on textField

        var datePicker: UIDatePicker
        datePicker = UIDatePicker(frame: CGRect(x:0, y:0, width: PersonalDataView().frame.size.width, height:216))
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        
        return datePicker
        
    }()
    
    
    lazy private var toolBar: UIToolbar = {
        // Create panel to button "done" on Date Picker
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        // add button on Date Piecker
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }()
    
    
    // MARK: - override
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNameField()
        setupbirthDateField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    // Close keyboard after input after press on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // MARK: - setup
    
    private func setupNameField(){
        self.nameTextField.delegate = self
        self.nameTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupbirthDateField(){
        
        self.birthDateTextField.delegate = self
        
        // Sety image on Birth Date
        changeIcon(name: "calendarGrey.png")
        
        self.birthDateTextField.inputView = self.datePicker
        self.birthDateTextField.inputAccessoryView = self.toolBar
        
        self.birthDateTextField.layer.borderColor = UIColor.lightGray.cgColor
    }

    
    func layerPressedTextField(_ sender: UITextField){
        sender.layer.borderWidth = 2.0
        sender.layer.borderColor = UIColor.red.cgColor
        sender.layer.cornerRadius = 5
    }
    
    func layerOutFromTextField(_ sender: UITextField){
        sender.layer.borderWidth = 1.0
        sender.layer.borderColor = UIColor.lightGray.cgColor
        sender.layer.cornerRadius = 5
    }
    
    func validationFields(){
        if (birthDateTextField.text != "" && nameTextField.text != "")
        {
            nextButton.isEnabled = true
            nextButton.alpha = 1
        }
    }
    
    
    // Change icon in textField for Date
    func changeIcon(name: String)
    {
        let imageView = UIImageView(image: UIImage(named: name))
        imageView.contentMode = UIView.ContentMode.center
        imageView.frame = CGRect(x: 0.0, y:0.0, width: imageView.image!.size.width + 20, height: imageView.image!.size.height)
        birthDateTextField.rightViewMode = UITextField.ViewMode.always
        birthDateTextField.rightView = imageView
    }
    
}

extension PersonalDataView {
    
    // Set date from Date Piecker to textField
    @objc func doneClick()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthDateTextField.text = dateFormatter.string(from: datePicker.date)
        birthDateTextField.resignFirstResponder()
    }
}


