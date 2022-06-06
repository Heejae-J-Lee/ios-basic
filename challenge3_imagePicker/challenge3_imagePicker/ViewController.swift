//
//  ViewController.swift
//  challenge3_imagePicker
//
//  Created by Heejae on 2022/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    var currentPicture = 3
    var selectedImg = "3.jpg"
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentDate: UILabel!
    @IBOutlet var lblSelectedDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: selectedImg)
        //view.backgroundColor = .black
        Timer.scheduledTimer(timeInterval:interval , target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        currentPicture = currentPicture - 1
        if (currentPicture < 1){
            currentPicture = 5
        }
        selectedImg = String(currentPicture) + ".jpg"
        imgView.image = UIImage(named: selectedImg)
    }
    @IBAction func btnNext(_ sender: UIButton) {
        currentPicture = currentPicture + 1
        if (currentPicture > 5){
            currentPicture = 1
        }
        selectedImg = String(currentPicture) + ".jpg"
        imgView.image = UIImage(named: selectedImg)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectedDate.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentDate.text = "현재시간 : " + formatter.string(from: date as Date)
        
        let current = lblCurrentDate.text?.split(separator: " ")
        let selected = lblSelectedDate.text?.split(separator: " ")
        if (current!.count > 3 && selected!.count > 3 && current![2] == selected![2] && current![3] == selected![3]){
            count = count + 1
            view.backgroundColor = .systemRed
        }
        else {
            count = 0
            view.backgroundColor = .white
        }
        if (count > 60){
            view.backgroundColor = .blue
            count = 0
        }
    }
}

