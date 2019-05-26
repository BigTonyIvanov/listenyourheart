//
//  TimeDataFactory.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/26/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

class TimeDataFactory: PredictionsDataFactory {
    
    func produce() -> PredictionsData {
        return TimeData(name: self.getRandomData())
    }
    
    func getRandomData() -> String{
        let randomDate = Int.random(in: 1...1440)
        let randomMin = randomDate % 60
        let randomOur = (randomDate - randomMin) / 60
        let name = String(randomOur) + " : " + String(randomMin)
        return name
    }
    
}
