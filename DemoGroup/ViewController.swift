//
//  ViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/1.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let observableA = Observable.of("1", "2", "3")
//            .map { $0 + "OH MY GOD" }
//        observableA
//            .subscribe(onNext: { (str) in
//                print(str)
//            }, onError: { (error) in
//                assert(true)
//            }, onCompleted: {
//                print("Success!")
//            }).disposed(by: disposeBag)
//
//        let observableB = Observable.of("1", "2", "3")
//            .map { Observable.just($0) }
//        observableB.subscribe(onNext: { (observable) in
//            print(observable)
//        }, onError: { (error) in
//            assert(true)
//        }, onCompleted: {
//            print("Success")
//        }).disposed(by: disposeBag)
//
//        let observableC = Observable.of("1", "2", "3")
//            .map { Observable.just($0) }
//            .merge()
//        observableC.subscribe(onNext: { (mergedObservable) in
//            print(mergedObservable)
//        }, onError: { (error) in
//            assert(true)
//        }, onCompleted: {
//            print("Success")
//        }).disposed(by: disposeBag)
//
//        let observableD = Observable.of("1", "2", "3")
//            .flatMap { Observable.just($0) }
//        observableD.subscribe(onNext: { (str) in
//            print(str)
//        }, onError: { (error) in
//            assert(true)
//        }, onCompleted: {
//            print("Success")
//        }).disposed(by: disposeBag)
//
//        let observableE = Observable.of("1", "2", "3")
//            .flatMapLatest { Observable.just($0) }
//        observableE.subscribe(onNext: { (str) in
//            print(str)
//        }, onError: { (error) in
//            assert(true)
//        }, onCompleted: {
//            print("Success")
//        }).disposed(by: disposeBag)
        
        let subject1 = BehaviorSubject(value: "A")
//        let subject2 = BehaviorSubject(value: "1")
        
        let variable = Variable(subject1)
        
        variable.asObservable()
            .flatMapLatest { $0 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
//        subject1.onNext("B")
//        variable.value = subject2
//        subject2.onNext("2")
//        subject1.onNext("C")
    }
}

