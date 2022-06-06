//
//  EditViewController.swift
//  Navigation
//
//  Created by Heejae on 2022/06/05.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {

    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var swlsOn: UISwitch!
    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = isOn
    }
    
    @IBAction func btnDonw(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message:  txMessage.text!)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImgOnOff(_ sender: UISwitch) {
        if delegate != nil {
            delegate?.didImageOnOffDone(self, isOn: sender.isOn)
        }
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
