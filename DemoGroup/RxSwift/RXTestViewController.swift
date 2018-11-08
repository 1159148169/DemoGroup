//
//  RXTestViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/1.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Student: NSObject {
    var name = ""
    var score = 0
    
    override init() {
        super.init()
    }
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

class RXTestViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "RxCellTest", bundle: nil), forCellReuseIdentifier: "RxCellTest")
        
        let studentData = Observable.just([
            Student.init(name: "John", score: 90),
            Student.init(name: "Jobs", score: 100),
            Student.init(name: "Allen", score: 98)
            ])
        
        studentData.bind(to: tableView.rx.items(cellIdentifier: "RxCellTest", cellType: RxCellTest.self)) { row, data, cell in
            cell.textLabel?.text = data.name
            cell.detailTextLabel?.text = "\(data.score)"
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Student.self).subscribe(onNext: { (student) in
            print("点击\(student.name), 点击\(student.score)")
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("点击Cell完成")
        }).disposed(by: disposeBag)
    }

    fileprivate func showBaseRxSwift() {
        let observableA = Observable.of("1", "2", "3")
            .map { $0 + "OH MY GOD" }
        observableA
            .subscribe(onNext: { (str) in
                print(str)
            }, onError: { (error) in
                assert(true)
            }, onCompleted: {
                print("Success!")
            }).disposed(by: disposeBag)
        
        let observableB = Observable.of("1", "2", "3")
            .map { Observable.just($0) }
        observableB.subscribe(onNext: { (observable) in
            print(observable)
        }, onError: { (error) in
            assert(true)
        }, onCompleted: {
            print("Success")
        }).disposed(by: disposeBag)
        
        let observableC = Observable.of("1", "2", "3")
            .map { Observable.just($0) }
            .merge()
        observableC.subscribe(onNext: { (mergedObservable) in
            print(mergedObservable)
        }, onError: { (error) in
            assert(true)
        }, onCompleted: {
            print("Success")
        }).disposed(by: disposeBag)
        
        let observableD = Observable.of("1", "2", "3")
            .flatMap { Observable.just($0) }
        observableD.subscribe(onNext: { (str) in
            print(str)
        }, onError: { (error) in
            assert(true)
        }, onCompleted: {
            print("Success")
        }).disposed(by: disposeBag)
        
        let observableE = Observable.of("1", "2", "3")
            .flatMapLatest { Observable.just($0) }
        observableE.subscribe(onNext: { (str) in
            print(str)
        }, onError: { (error) in
            assert(true)
        }, onCompleted: {
            print("Success")
        }).disposed(by: disposeBag)
        
        let subject1 = BehaviorSubject(value: "A")
        let subject2 = BehaviorSubject(value: "1")
        
        let variable = Variable(subject1)
        
        variable.asObservable()
            .flatMapLatest { $0 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        subject1.onNext("B")
        variable.value = subject2
        subject2.onNext("2")
        subject1.onNext("C")
    }
}
