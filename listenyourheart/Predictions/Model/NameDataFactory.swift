//
//  NameDataFactory.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/26/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

class NameDataFactory: PredictionsDataFactory {
    
    func produce() -> PredictionsData {
        return NameData(name: self.getRandomData())
    }
    
    private func getDefauiltData() -> Array<String>{
        return ["Karl", "Peter", "Alena", "Yana", "Ulya", "Kris", "Anton", "Ivan", "Jul"]
    }
    
    func getRandomData() -> String{
        let randomVal = getDefauiltData().randomElement()
        let name = randomVal ?? "Viktor"
        return name
    }

    
}
