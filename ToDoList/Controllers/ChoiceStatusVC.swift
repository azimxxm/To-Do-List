//
//  ChoiceStatusVC.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 08/11/22.
//

import UIKit

class ChoiceStatusVC: UIViewController {
    
    var delegate: ChoiceStatusDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func closeBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func hightBtnPressed(_ sender: UIButton) {
        self.delegate?.setStatus(status: .Hight)
        self.dismiss(animated: true)
        
    }
    
    @IBAction func mediumBtnPressed(_ sender: UIButton) {
        self.delegate?.setStatus(status: .Medium)
        self.dismiss(animated: true)
    }
    
    @IBAction func lowBtnPressed(_ sender: UIButton) {
        self.delegate?.setStatus(status: .Low)
        self.dismiss(animated: true)
    }
    
    @IBAction func noneBtnPressed(_ sender: UIButton) {
        self.delegate?.setStatus(status: .None)
        self.dismiss(animated: true)
    }
    
    
}
