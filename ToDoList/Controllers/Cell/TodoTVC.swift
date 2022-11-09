//
//  TodoTVC.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 07/11/22.
//

import UIKit

class TodoTVC: UITableViewCell {
    
    
    static let identifier: String = "TodoTVC"
    static func nib() -> UINib {
            return UINib(nibName: "TodoTVC", bundle: nil)
        }
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var statusUIView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(task: TaskDM) {
        titleLbl.text = task.title
        descriptionLbl.text = task.description
        
        switch task.status {
        case .Hight:
            statusUIView.backgroundColor = .red
        case .Medium:
            statusUIView.backgroundColor = .orange
        case .Low:
            statusUIView.backgroundColor = .systemGreen
        default:
            statusUIView.backgroundColor = .systemGray5
        }
    }
}
