//
//  ColorData.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/22/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

class ColorData: PredictionsData {
    var title: String
    var name: String
    var description: String
    
    
    init(title: String, name: String, description: String) {
        self.title = title
        self.name = name
        self.description = description
    }
    
    init(name: String) {
        self.title = "Color"
        self.name = name
        self.description = ""
    }
    
    
    
    
    
    
}

