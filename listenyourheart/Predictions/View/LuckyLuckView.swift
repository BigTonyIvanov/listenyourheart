//
//  LuckyLuckView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 4/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class LuckyLuckView: UIView, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet{
            scrollView.delegate = self
        }
    }
    
    var slides:[SliderPredictions] = [];

    override func awakeFromNib() {
        super.awakeFromNib()
        
        slides = self.createSlides()
        self.setupSlideScrollView(slides: slides)
    }
 
    
    func createSlides() -> [SliderPredictions] {

        let slide1:SliderPredictions = Bundle.main.loadNibNamed("SliderPredictions", owner: self, options: nil)?.first as! SliderPredictions
        slide1.title.text = "Name:"
        slide1.value.text = "Karl"
        slide1.additInfo.text = "Use it today for dating"
        
        let slide2:SliderPredictions = Bundle.main.loadNibNamed("SliderPredictions", owner: self, options: nil)?.first as! SliderPredictions
        slide2.title.text = "Time:"
        slide2.value.text = "19:58"
        slide2.additInfo.text = ""
        
        let slide3:SliderPredictions = Bundle.main.loadNibNamed("SliderPredictions", owner: self, options: nil)?.first as! SliderPredictions
        slide3.title.text = "Color:"
        slide3.value.text = "Black"
        slide3.additInfo.text = ""

        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [SliderPredictions]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(slides.count), height: self.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
  
}
