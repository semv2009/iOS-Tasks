//
//  TaskTableViewCell.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import UIKit
import Domain

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var importanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configureCell(with task: Task) {
        titleLabel.text = task.title
        contentLabel.text = task.content
        importanceLabel.text =  task.createDate?.dateString
        dateLabel.text = "\(task.isExecute)"
    }
}
