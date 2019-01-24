//
//  WelcomView.swift
//  listenyourheart
//
//  Created by Антон Иванов on 1/23/19.
//  Copyright © 2019 Антон Иванов. All rights reserved.
//

import Foundation
import UIKit

final class WelcomView: UIView, UIScrollViewDelegate{
    
    // MARK: - Subviews
    
    private var slides:[Slide] = [];
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
        {
        didSet{
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Override
    
    // This function use for settings properties which created from @IBOutlet
    override func awakeFromNib() {
        super.awakeFromNib()

        setupScrollView()
        setupPageControl()
        setupGetStartedButton()
 
    }
    
    // Default function called when view is scolled. In order to enable callback
    // when scrollview is scrolled, the below code needs to be called:
    // slideScrollView.delegate = self or
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let pageIndex = round(scrollView.contentOffset.x/self.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    // MARK: - Setup
    private func setupGetStartedButton() {
       // getStartedButton.backgroundColor = .blue
    }
    
    private func setupScrollView() {
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        self.bringSubviewToFront(pageControl)
    }
    
    
    
    // MARK: - Validation
    
    func createSlides() -> [Slide]
    {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.invitedText.text = "27 people won over $1 million last week using our lucky numbers"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.invitedText.text = "Smth else"
        
        return [slide1, slide2]
    }
    
    
    // MARK: - Positions
    
    func setupSlideScrollView(slides : [Slide])
    {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(slides.count), height: self.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count
        {
            slides[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
  
    
}
