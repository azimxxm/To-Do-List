//
//  AddVC.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 08/11/22.
//

import UIKit

class AddVC: UIViewController {
    
    
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var descriptionTF: UITextView!
    @IBOutlet var statusBtn: UIButton!
    
    var delegate: AddVCDelegate?
    var setStatus: StatusType = .None
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

//    MARK: - Close Window

    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

//    MARK: - Set status for evry task

    @IBAction func choiceStatusBtnPressed(_ sender: UIButton) {
        let choiceStatusVC = ChoiceStatusVC(nibName: "ChoiceStatusVC", bundle: nil)
        choiceStatusVC.delegate = self
        choiceStatusVC.modalPresentationStyle = .overFullScreen
        present(choiceStatusVC, animated: false)
    }

    //   MARK: - Add Button Pressed func

    @IBAction func addTaskBtnPressed(_ sender: UIButton) {
        
        if titleTF.text == "" {
            showAlert("The title can not be empty!", "Please write the task title a new task", .alert, alertAction: UIAlertAction(title: "OK", style: .default))
        } else {
            let task = TaskDM(title: titleTF.text!, description: descriptionTF.text, status: setStatus)
            self.delegate?.add(new: task)
            dismiss(animated: false)
        }
//
    }


}

// MARK: - ChoiceStatusDelegate

extension AddVC: ChoiceStatusDelegate {
    func setStatus(status: StatusType) {
        switch status {
        case .Hight:
            updateStyle(status: .Hight, color: .red)
        case .Medium:
            updateStyle(status: .Medium, color: .orange)
        case .Low:
            updateStyle(status: .Low, color: .systemGreen)
        default:
            updateStyle(status: .None, color: .systemGray5)
        }
        func updateStyle(status: StatusType, color: UIColor) {
            statusBtn.backgroundColor = color
            setStatus = status
            statusBtn.setTitle("\(status)", for: .normal)
        }
    }
}

