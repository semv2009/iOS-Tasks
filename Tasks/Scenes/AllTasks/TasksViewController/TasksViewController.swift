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
        title = "Todo-List"
        configureBarButtonitem()
        configureTableView()
        bindViewModel()
    }
    
    func configureBarButtonitem() {
        createTaskButton = UIBarButtonItem(title: "Create", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem =  createTaskButton
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(cell: TaskTableViewCell.self)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                print(indexPath)
            })
            .disposed(by: disposebag)
    }
    
    private func bindViewModel() {
        let input = TasksViewModel.Input(trigger: Driver.just(),
                                         createTaskTrigger: createTaskButton.rx.tap.asDriver(),
                                         selection: tableView.rx.itemSelected.asDriver())

        let output = viewModel.transform(input: input)
        
        output.tasks.drive(tableView.rx.items(cellIdentifier: TaskTableViewCell.reuseID, cellType: TaskTableViewCell.self)) { tv, item, cell in
            cell.configureCell(with: item)
        }.addDisposableTo(disposebag)
        
        output.createTask.drive().addDisposableTo(disposebag)
        output.selectTask.drive().addDisposableTo(disposebag)
    }
}
