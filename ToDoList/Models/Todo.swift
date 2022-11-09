//
//  Todo.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 07/11/22.
//

import Foundation

//struct Todo {
//    var title: String
//    var description: String
//    var status: Status
//    var section: Sections
//    var tasks: []
//}


struct TaskGroupDM {
    
    var groupType: SectionType
    var tasks: [TaskDM]
    
}

struct TaskDM {
    
    var title: String
    var description: String
    var status: StatusType
    
}


enum StatusType: Codable {
    case Hight
    case Medium
    case Low
    case None
}

enum SectionType: String, Codable {
    case New
    case Finish
    case Archive
}




//var list:[Todo] = [
//    Todo(title: "salom", description: "qaledsan", status: .Hight, section: .New),
//    Todo(title: "qalesan", description: "salom", status: .Low, section: .Archive),
//    Todo(title: "Ukam", description: "Nima ejfhgergwijflwiehflherlvbevb ehgeirhgier eiorhgoiehrfpie ephrgpiehrgphe lehfggerowfgou poewjhdfpoihwioef erpofhjsophjdfpwejhrfp", status: .Medium, section: .Finish),
//    Todo(title: "Nima disan?", description: "aaugwfugqwougiusgduigwiuGDVIUgweugvouwgEOUCGosgdcuweeucgogcofa", status: .None, section: .New),
//]


