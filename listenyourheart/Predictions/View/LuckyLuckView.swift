//
//  LuckyLuckView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 4/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import UIKit

class LuckyLuckView: UIView {
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet{
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    
    var slides:[SliderPredictions] = [];

    override func awakeFromNib() {
        super.awakeFromNib()
        
        slides = self.createSlides()
        self.setupSlideScrollView(slides: slides)
        self.setupSegmentedControl()
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
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(slides.count), height: 1.0)
        scrollView.isPagingEnabled = true
        scrollView.isUserInteractionEnabled = true
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: UIScreen.main.bounds.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func setupSegmentedControl(){
        
        for (index, item) in createSlides().enumerated(){
            self.segmentedControl.setTitle(item.title.text, forSegmentAt: index)
        }
    }
    
  
}

extension LuckyLuckView: UIScrollViewDelegate{
    
    
     // default function called when view is scrolled. In order to enable callback
     // when scrollview is scrolled, the below code needs to be called:
     // slideScrollView.delegate = self or

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/self.frame.width)
        self.segmentedControl.selectedSegmentIndex = Int(pageIndex)
        
    }
    
    func chaneSelectedPage(to index: Int){

        self.scrollView.setContentOffset(CGPoint(x: self.frame.width * CGFloat(index),
                                                 y: self.scrollView.contentOffset.y),
                                         animated: true)
    }
}
