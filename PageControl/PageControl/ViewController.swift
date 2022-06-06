//
//  ViewController.swift
//  PageControl
//
//  Created by Heejae on 2022/06/05.
//

import UIKit

var images = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
              "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

