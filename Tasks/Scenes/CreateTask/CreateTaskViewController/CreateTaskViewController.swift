//
//  CreateTaskViewController.swift
//  Tasks
//
//  Created by Семен Никулин on 10.04.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CreateTaskViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var importanceTextField: UITextField!
    @IBOutlet weak var executeSegmentController: UISegmentedControl!
    
    var saveBarButton: UIBarButtonItem!
    var cancelBarButton: UIBarButtonItem!
    
    let importanceViewPicker = NativePickerView<Importance>(source: Importance.source)
    let datePicker = UIDatePicker()
    
    var viewModel: CreateTaskViewModel!
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        configureBarButtonItems()
        configureTextView()
        bindViewModel()
        bindTitleChanged()
        configureTextFields()
    }
    
    func configureTextFields() {
        importanceTextField.inputView = importanceViewPicker
        dateTextField.inputView = datePicker
    }
    
    func configureTextView() {
        contentTextView.layer.borderColor = UIColor.gray.cgColor
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 5.0
    }
    
    func configureBarButtonItems() {
        saveBarButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem =  saveBarButton
        cancelBarButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem =  cancelBarButton
    }
    
    func bindTitleChanged() {
        titleTextField.rx.text
            .orEmpty
            .subscribe(onNext: { self.title = $0 })
            .addDisposableTo(disposeBag)
    }
    
    private func bindViewModel() {
        let input = CreateTaskViewModel.Input(cancelTrigger: cancelBarButton.rx.tap.asDriver(),
                                  saveTrigger: saveBarButton.rx.tap.asDriver(),
                                  title: titleTextField.rx.text.orEmpty.asDriver(),
                                  details: contentTextView.rx.text.orEmpty.asDriver(),
                                  importance: importanceViewPicker.itemSelected,
                                  date: datePicker.rx.date.asObservable(),
                                  solved: executeSegmentController.rx.value.asDriver(),
                                  importanceString: importanceTextField.rx.text.orEmpty.asDriver(),
                                  dateString: dateTextField.rx.value.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        
        output.save.drive()
            .disposed(by: disposeBag)
        output.dismiss.drive()
            .disposed(by: disposeBag)
        output.saveEnabled.drive(saveBarButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        output.importanceText
            .bindTo(importanceTextField.rx.text)
            .disposed(by: disposeBag)
        importanceTextField.text = ""
        
        output.dateText
            .bindTo(dateTextField.rx.text)
            .disposed(by: disposeBag)
        dateTextField.text = ""
    }
}
