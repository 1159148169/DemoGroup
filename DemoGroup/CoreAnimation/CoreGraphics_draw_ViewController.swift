//
//  CoreGraphics_draw_ViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/9.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit

class CoreGraphics_draw_ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var typeArray: [CGTypeModel] = []
    var typeName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CGDrawLineCell", bundle: nil), forCellReuseIdentifier: "CGDrawLineCell")
    }
}

extension CoreGraphics_draw_ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch typeName {
        case "绘制线条":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CGDrawLineCell", for: indexPath) as! CGDrawLineCell
            return cell
        case "绘制图形":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CGDrawLineCell", for: indexPath) as! CGDrawLineCell
            return cell
        case "绘制渐变":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CGDrawLineCell", for: indexPath) as! CGDrawLineCell
            return cell
        case "绘制图片及图形变换":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CGDrawLineCell", for: indexPath) as! CGDrawLineCell
            return cell
        case "绘制文字及文字排版":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CGDrawLineCell", for: indexPath) as! CGDrawLineCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CGDrawLineCell", for: indexPath) as! CGDrawLineCell
            return cell
        }
    }
}

extension CoreGraphics_draw_ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
