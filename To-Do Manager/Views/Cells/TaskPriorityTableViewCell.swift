//
//  TaskPriorityTableViewCell.swift
//  To-Do Manager
//
//  Created by Arman  Urstem on 28.08.2024.
//

import UIKit

class TaskPriorityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
