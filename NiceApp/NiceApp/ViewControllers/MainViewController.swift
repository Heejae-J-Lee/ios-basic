//
//  ViewController.swift
//  NiceApp
//
//  Created by Heejae on 2022/04/08.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
        
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Main"
        label.font = .boldSystemFont(ofSize: 70)
        return label
    }()
    
    let animationView : AnimationView = {
        let animView = AnimationView(name: "101381-orange-t-shirt-coder")
        animView.frame = CGRect(x:0, y:0, width: 400, height:400)
        animView.contentMode = .scaleAspectFill
        return animView
    }()
    
    // when the view is created
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        // play animation
        animationView.play{ (finish) in
            print("animation is end")
            self.view.backgroundColor = .white
            
            self.animationView.removeFromSuperview()
            
            self.view.addSubview(self.titleLabel)
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
    }
    

}

