//
//  ViewController.swift
//  imageView
//
//  Created by Heejae on 2022/05/22.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var BtnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named:"lamp_on.png")
        imgOff = UIImage(named:"lamp_off.png")
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            BtnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            BtnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width:newWidth, height:newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

