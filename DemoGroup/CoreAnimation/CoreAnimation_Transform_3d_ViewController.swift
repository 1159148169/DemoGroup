//
//  CoreAnimation_Transform_3d_ViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/7.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit

enum RotationCoordinate {
    case x
    case y
    case z
}

class CoreAnimation_Transform_3d_ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var rotationAngleTextField: UITextField!
    @IBOutlet weak var m34TextField: UITextField!
    @IBOutlet weak var demoView: UIView!
    @IBOutlet weak var transformButton: UIButton!
    
    fileprivate var rotationAngle: CGFloat = 0
    fileprivate var rotationAngleX: CGFloat = 0
    fileprivate var rotationAngleY: CGFloat = 0
    fileprivate var rotationAngleZ: CGFloat = 0
    fileprivate var m34: CGFloat = 0
    fileprivate var coordinate: RotationCoordinate = .x
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    fileprivate func initData() {
        rotationAngle = 0
        rotationAngleX = 0
        rotationAngleY = 0
        rotationAngleZ = 0
        m34 = 0
        coordinate = .x
    }
    
    @objc
    fileprivate func hideKeyboard() {
        rotationAngleTextField.resignFirstResponder()
        m34TextField.resignFirstResponder()
    }
    
    @IBAction func transform(_ sender: UIButton) {
        initData()
        rotationAngle = CGFloat(((rotationAngleTextField.text ?? "0") as NSString).floatValue)
        m34 = CGFloat(((m34TextField.text ?? "0") as NSString).floatValue)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            coordinate = .x
            rotationAngleX = 1
        case 1:
            coordinate = .y
            rotationAngleY = 1
        case 2:
            coordinate = .z
            rotationAngleZ = 1
        default:
            coordinate = .x
            rotationAngleX = 1
        }
        
        var transform = CATransform3DIdentity
        transform.m34 = m34
        transform = CATransform3DRotate(transform, rotationAngle, rotationAngleX, rotationAngleY, rotationAngleZ)
        
        demoView.layer.transform = transform
    }
}
