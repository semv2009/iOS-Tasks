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
        dateLabel.text = task.createDate?.dateString
        
        if task.isExecute {
            titleLabel.setCrossOutText(task.title)
            contentLabel.setCrossOutText(task.content)
        }
        
        guard let importance = Importance(rawValue: task.importance) else { return }
        switch importance {
        case .low:
            importanceLabel.backgroundColor = UIColor.blue
        case .normal:
            importanceLabel.backgroundColor = UIColor.green
        case .high:
            importanceLabel.backgroundColor = UIColor.red
        }
        importanceLabel.text =  importance.description
    }
}
