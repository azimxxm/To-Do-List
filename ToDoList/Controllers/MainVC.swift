//
//  MainVC.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 07/11/22.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var grtasks: [TaskGroupDM] = [
        TaskGroupDM(groupType: .New, tasks: []),
        TaskGroupDM(groupType: .Finish, tasks: []),
        TaskGroupDM(groupType: .Archive, tasks: [])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My To-Do List"
        setNavigationStyle()
        setupTableView()
    }
    
//    MARK:- setup tableview
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoTVC.nib(), forCellReuseIdentifier: TodoTVC.identifier)
        tableView.sectionHeaderTopPadding = 2.0
    }

//    MARK: - Set Style for UINavigationBarAppearance

    func setNavigationStyle() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemGreen
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24.0)]

        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
    }

    @IBAction func addBtnTapped(_ sender: UIButton) {
        let addVC = AddVC(nibName: "AddVC", bundle: nil)
        addVC.modalPresentationStyle = .overFullScreen
        addVC.delegate = self
        self.present(addVC, animated: false)
    }
}


// MARK: - UITableViewDelegate

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        let w = grtasks[section].groupType.rawValue.widthOfString(usingFont: .boldSystemFont(ofSize: 20))
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: w+20, height: 32))
        lbl.textColor = .systemGreen
        lbl.textAlignment = .center
        lbl.text = grtasks[section].groupType.rawValue
        lbl.center = v.center
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.backgroundColor = .systemGray5
        v.addSubview(lbl)
        return v
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard grtasks[section].tasks.count != 0 else { return 0 }
        return 40
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let task = self.grtasks[indexPath.section]
        switch task.groupType {
        case .New:
            let archiveAction = UIAlertAction(title: "Archive", style: .default, handler: { action in
                self.grtasks[2].tasks.append(task.tasks[indexPath.row])
                self.grtasks[indexPath.section].tasks.remove(at: indexPath.row)
                tableView.reloadData()
            })
            alert.addAction(archiveAction)

            let finishAction = UIAlertAction(title: "Finish", style: .default, handler: { action in
                self.grtasks[1].tasks.append(task.tasks[indexPath.row])
                self.grtasks[indexPath.section].tasks.remove(at: indexPath.row)
                tableView.reloadData()
                })
            alert.addAction(finishAction)

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .Archive:
            let archiveAction = UIAlertAction(title: "Unarchive", style: .default, handler: { action in
                self.grtasks[0].tasks.append(task.tasks[indexPath.row])
                self.grtasks[indexPath.section].tasks.remove(at: indexPath.row)
                tableView.reloadData()
            })
            alert.addAction(archiveAction)

            let finishAction = UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                self.grtasks[1].tasks.append(task.tasks[indexPath.row])
                self.grtasks[indexPath.section].tasks.remove(at: indexPath.row)
                tableView.reloadData()
                })
            alert.addAction(finishAction)

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        default:
            let archiveAction = UIAlertAction(title: "Archive", style: .default, handler: { action in
                self.grtasks[2].tasks.append(task.tasks[indexPath.row])
                self.grtasks[indexPath.section].tasks.remove(at: indexPath.row)
                tableView.reloadData()
            })
            alert.addAction(archiveAction)

            let finishAction = UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                self.grtasks[indexPath.section].tasks.remove(at: indexPath.row)
                tableView.reloadData()
                })
            alert.addAction(finishAction)

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

            
    }
}




// MARK: - UITableViewDataSource

extension MainVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return grtasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grtasks[section].tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTVC.identifier, for: indexPath) as? TodoTVC else { return UITableViewCell() }
        cell.updateCell(task: grtasks[indexPath.section].tasks[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let myAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
//                list.remove(at: indexPath.row)
                self.grtasks[indexPath.section].tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        let preventSwipeFullAction = UISwipeActionsConfiguration(actions: [myAction ])
        preventSwipeFullAction .performsFirstActionWithFullSwipe = true
        return preventSwipeFullAction
        }
    
    
    
}

extension MainVC: AddVCDelegate {
    
    func add(new task: TaskDM) {
        grtasks[0].tasks.append(task)
        tableView.reloadData()
    }
    
}
