//
//  Protocol.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 08/11/22.
//

import Foundation


protocol ChoiceStatusDelegate {
    func setStatus(status: StatusType)
}


protocol ReloadDataDelegate {
    func reladData()
}


protocol AddVCDelegate {
    
    func add(new task: TaskDM)
    
}
