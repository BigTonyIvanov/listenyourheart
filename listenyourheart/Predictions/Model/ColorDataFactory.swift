//
//  ColorDataFactory.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/26/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

class ColorDataFactory: PredictionsDataFactory {
    
    func produce() -> PredictionsData {
        return ColorData(name: self.getRandomData())
    }
    
    private func getDefauiltData() -> Array<String>{
        return ["Yello", "Black", "Blue", "Green", "Pink", "Red", "Grey", "Orange"]
    }
    
    func getRandomData() -> String{
        let randomVal = getDefauiltData().randomElement()
        let name = randomVal ?? "Purple"
        return name
    }
    
}
