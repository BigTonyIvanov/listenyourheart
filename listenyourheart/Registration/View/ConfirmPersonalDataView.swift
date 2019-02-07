//
//  ConfirmPersonalDataView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/27/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class ConfirmPersonalDataView: UIView{
    // Mark: - subviews
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var zodiacSign: UIImageView!
    @IBOutlet weak var chineseYear: UIImageView!
    
    
    
    // MARK: - override
    override func awakeFromNib() {
        super.awakeFromNib()        
    }

    
    // MARK: - setup
   
    func setZodiacSign(with imgName: String){
        if(zodiacSign != nil){
            zodiacSign.image = UIImage(named: imgName)
            
        }
        
    }
    
    func setChineseYear(with imgName: String){
        if(chineseYear != nil){
            chineseYear.image = UIImage(named: imgName)
            
        }
    }
    

    
}


