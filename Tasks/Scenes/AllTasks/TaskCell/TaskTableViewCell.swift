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
        importanceLabel.text =  task.importance
        dateLabel.text = task.createDate?.dateString
        
        if task.isExecute {
            titleLabel.setCrossOutText(task.title)
            contentLabel.setCrossOutText(task.content)
            importanceLabel.setCrossOutText(task.importance)
            dateLabel.setCrossOutText(task.createDate?.dateString)
        }
    }
}
