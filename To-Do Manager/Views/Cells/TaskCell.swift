//
//  TaskCell.swift
//  To-Do Manager
//
//  Created by Arman  Urstem on 28.08.2024.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(withTask task: Task) {
        symbolLabel.text = getStatusSymbolForTask(with: task.status)
        titleLabel.text = task.title
        
        switch task.priority {
        case .important:
            titleLabel.font = UIFont.systemFont(ofSize: titleLabel.font.pointSize, weight: .semibold)
        case .normal:
            titleLabel.font = UIFont.systemFont(ofSize: titleLabel.font.pointSize, weight: .regular)
        }
        
        // set text color and symbol
        switch task.status {
        case .planned:
            titleLabel.textColor = UIColor.label
            symbolLabel.textColor = UIColor.label
        case .completed:
            titleLabel.textColor = UIColor.lightGray
            symbolLabel.textColor = UIColor.lightGray
        }
        
        selectionStyle = .default
    }
    
    func configureNoTasksCell() {
        symbolLabel.text = nil
        titleLabel.text = "No Tasks"
        titleLabel.textColor = UIColor.tertiaryLabel
        titleLabel.font = UIFont.systemFont(ofSize: titleLabel.font.pointSize, weight: .regular)
        
        selectionStyle = .none
    }
    
    // return the symbol for the corresponding task type
    private func getStatusSymbolForTask(with status: TaskStatus) -> String {
        switch status {
        case .planned:   return "\u{25CB}" // ○
        case .completed: return "\u{25C9}" // ◉
        }
    }
}
