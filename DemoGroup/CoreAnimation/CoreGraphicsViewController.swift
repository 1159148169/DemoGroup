//
//  CoreGraphicsViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/9.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit

class CoreGraphicsViewController: UIViewController {
    
    var typeArray: [CGTypeModel] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CGTypeCell", bundle: nil), forCellReuseIdentifier: "CGTypeCell")
        
        let drawLine = CGTypeModel(name: "绘制线条")
        typeArray.append(drawLine)
        let drawGraph = CGTypeModel(name: "绘制图形")
        typeArray.append(drawGraph)
        let drawGradient = CGTypeModel(name: "绘制渐变")
        typeArray.append(drawGradient)
        let drawPic = CGTypeModel(name: "绘制图片及图形变换")
        typeArray.append(drawPic)
        let drawText = CGTypeModel(name: "绘制文字及文字排版")
        typeArray.append(drawText)
        
        tableView.reloadData()
    }
}

extension CoreGraphicsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = CoreGraphics_draw_ViewController()
        vc.typeArray = typeArray
        vc.typeName = typeArray[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CoreGraphicsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CGTypeCell", for: indexPath) as! CGTypeCell
        cell.textLabel?.text = typeArray[indexPath.row].name
        return cell
    }
}
