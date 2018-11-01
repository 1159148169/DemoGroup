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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        
        let studentData = Observable.just([
            Student.init(name: "John", score: 90),
            Student.init(name: "Jobs", score: 100),
            Student.init(name: "Allen", score: 98)
            ])
        
        studentData.bind(to: tableView.rx.items(cellIdentifier: "RXCellTest")) { _, data, cell in
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

}
