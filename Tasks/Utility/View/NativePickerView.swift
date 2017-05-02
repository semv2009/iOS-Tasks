//
//  NativePickerView.swift
//  Tasks
//
//  Created by Семен Никулин on 01.05.17.
//  Copyright © 2017 niksemv. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class NativePickerView<T: CustomStringConvertible> : UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    let disposeBag = DisposeBag()
    let dataVariable = Variable([T]())
    
    convenience init(source: [T]) {
        self.init(frame: CGRect.zero)
        self.dataVariable.value = source
        self.delegate = self
        self.dataSource = self
        
        dataVariable.asObservable()
            .subscribe(onNext: { _ in
                self.reloadComponent(0)
            })
            .disposed(by: self.disposeBag)
    }
    
    var itemSelected: Observable<T> {
        return rx.itemSelected
            .flatMapFirst { row, _ in
                Observable.create({ observer -> Disposable in
                    observer.onNext(self.dataVariable.value[row])
                    observer.onCompleted()
                    return Disposables.create()
                })
            }
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataVariable.value.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataVariable.value[row].description
    }
}
