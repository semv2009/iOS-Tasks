//
//  TasksViewController.swift
//  Tasks
//
//  Created by Семен Никулин on 09.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

class TasksViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var createTaskButton: UIBarButtonItem!
    
    var viewModel: TasksViewModel!
    let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("To-do List", comment: "")
        configureBarButtonitem()
        configureTableView()
        bindViewModel()
    }
    
    func configureBarButtonitem() {
        createTaskButton = UIBarButtonItem(title: NSLocalizedString("Create", comment: ""), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem =  createTaskButton
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(cell: TaskTableViewCell.self)
    }
    
    private func bindViewModel() {
        let selectItem = tableView.rx.itemSelected.asDriver()
            .do(onNext: { self.tableView.deselectRow(at: $0, animated: false) })
        let input = TasksViewModel.Input(trigger: Driver.just(),
                                         createTaskTrigger: createTaskButton.rx.tap.asDriver(),
                                         selection: selectItem)

        let output = viewModel.transform(input: input)
        
        output.tasks.drive(tableView.rx.items(cellIdentifier: TaskTableViewCell.reuseID, cellType: TaskTableViewCell.self)) { tv, item, cell in
            cell.configureCell(with: item)
        }.addDisposableTo(disposebag)
        
        output.createTask.drive().addDisposableTo(disposebag)
        output.selectTask.drive().addDisposableTo(disposebag)
    }
}
