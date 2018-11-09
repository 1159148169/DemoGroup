//
//  ViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/1.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit
import RxSwift

class DemoGroupModel: NSObject {
    var name: String = ""
    
    override init() {
        super.init()
        name = ""
    }
    
    init(name: String) {
        self.name = name
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let demoGroupData = Observable.just([DemoGroupModel(name: "CoreAnimation"),
                                             DemoGroupModel(name: "CoreGraphics"),
                                             DemoGroupModel(name: "RxSwift")])
        demoGroupData.bind(to: tableView.rx.items(cellIdentifier: "DemoGroupMainCell", cellType: UITableViewCell.self)) { row, data, cell in
            cell.textLabel?.text = data.name
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(DemoGroupModel.self).subscribe { (model) in
            guard let element = model.element else { return }
            switch element.name {
            case "CoreAnimation":
                let vc = CoreAnimationViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case "CoreGraphics":
                let vc = CoreGraphicsViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case "RxSwift":
                let vc = RXTestViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                print("NO...")
            }
        }.disposed(by: disposeBag)
    }
}

