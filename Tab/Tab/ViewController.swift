//
//  ViewController.swift
//  Tab
//
//  Created by Heejae on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDataPickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
}

