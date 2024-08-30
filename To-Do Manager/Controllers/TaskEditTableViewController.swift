//
//  TaskEditTableViewController.swift
//  To-Do Manager
//
//  Created by Arman  Urstem on 29.08.2024.
//

import UIKit

protocol TaskEditViewControllerDelegate: AnyObject {
    func viewController(_ viewController: TaskEditViewControllerPr, didTapSaveButtonWithTask task: Task)
}

protocol TaskEditViewControllerPr: NavigatableViewControllerPr {
    var delegate: TaskEditViewControllerDelegate? { get set }
    var task: Task? { get set }
}

class TaskEditTableViewController: UITableViewController, TaskEditViewControllerPr {
    
    @IBOutlet weak var taskTitleTextFiled: UITextField!
    @IBOutlet weak var taskPriorityLabel: UILabel!
    @IBOutlet weak var taskStatusSwitch: UISwitch!
    
    var task: Task?
    weak var delegate: TaskEditViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task == nil {
            task = Task(title: "", priority: .important, status: .planned)
        }
        
        taskTitleTextFiled.text = task?.title
        taskPriorityLabel.text = task?.priority.string
        taskStatusSwitch.isOn = task?.status == .completed
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if let task {
            if task.title.trimmingCharacters(in: .whitespaces).isEmpty {
                showAlert(title: "Enter the task text", message: nil)
            } else {
                delegate?.viewController(self, didTapSaveButtonWithTask: task)
            }
        }
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        task?.title = sender.text ?? ""
    }
    
    @IBAction func switchDidChangeState(_ sender: UISwitch) {
        task?.status = sender.isOn ? .completed : .planned
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: // task priority row selected
            presentTaskPrioritiesViewController()
        case 2: // task status row selected
            toggleTaskStatus()
        default: break }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func toggleTaskStatus() {
        taskStatusSwitch.setOn(!taskStatusSwitch.isOn, animated: true)
        switchDidChangeState(taskStatusSwitch)
    }
    
    private func presentTaskPrioritiesViewController() {
        var taskPrioritiesVC = ViewControllerFactory.taskPrioritiesViewController
        
        taskPrioritiesVC.selectedPriority = task?.priority
        taskPrioritiesVC.selectionСompletion = { [weak self] priority in
            self?.task?.priority = priority
            self?.taskPriorityLabel.text = priority.string
        }
        
        taskPrioritiesVC.push(toNavigationController: navigationController)
    }
}

// MARK: - Private extensions for UI

private extension TaskPriority {
    var string: String {
        switch self {
        case .important: return "important"
        case .normal: return "normal" }
    }
}
