//
//  ViewController.swift
//  selfBasicProject
//
//  Created by Heejae on 2022/05/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var TxtFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        Label.text = "Hi, " + TxtFiled.text!
    }
}

