//
//  PredictionsData.swift
//  listenyourheart
//
//  Created by Антон Иванов on 5/22/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit
protocol PredictionsData {

    var title: String { get }
    var name: String { get }
    var description: String { get }
        
}

extension PredictionsData{
    func createSlide() -> SliderPredictions {
        let slide:SliderPredictions = Bundle.main.loadNibNamed("SliderPredictions", owner: LuckyLuckView(), options: nil)?.first as! SliderPredictions
        
        slide.title.text = self.title
        slide.value.text = self.name
        slide.additInfo.text = self.description
        
        return slide
    }
}


