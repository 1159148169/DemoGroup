//
//  CoreAnimation_Transform_certainObject_ViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/8.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit

class CoreAnimation_Transform_certainObject_ViewController: UIViewController {
    
    fileprivate var m34Value: CGFloat = -1 / 500
    fileprivate var identity = CATransform3DIdentity
    fileprivate var coordinate: RotationCoordinate = .x
    fileprivate var coordinateValueX: CGFloat = 0
    fileprivate var coordinateValueY: CGFloat = 0
    fileprivate var coordinateValueZ: CGFloat = 0
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var m34ValueTextField: UITextField!
    @IBOutlet weak var degreeSlider: UISlider!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var num1View: UIView!
    @IBOutlet weak var num2View: UIView!
    @IBOutlet weak var num3View: UIView!
    @IBOutlet weak var num4View: UIView!
    @IBOutlet weak var num5View: UIView!
    @IBOutlet weak var num6View: UIView!
    
    @IBAction func num1(_ sender: Any) {
        print("num1")
    }
    @IBAction func num2(_ sender: Any) {
        print("num2")
    }
    @IBAction func num3(_ sender: Any) {
        print("num3")
    }
    @IBAction func num4(_ sender: Any) {
        print("num4")
    }
    @IBAction func num5(_ sender: Any) {
        print("num5")
    }
    @IBAction func num6(_ sender: Any) {
        print("num6")
    }
    
    @IBAction func degreeControlAction(_ sender: UISlider) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            coordinate = .x
            coordinateValueX = 1
            coordinateValueY = 0
            coordinateValueZ = 0
        case 1:
            coordinate = .y
            coordinateValueX = 0
            coordinateValueY = 1
            coordinateValueZ = 0
        case 2:
            coordinate = .z
            coordinateValueX = 0
            coordinateValueY = 0
            coordinateValueZ = 1
        default:
            coordinate = .x
            coordinateValueX = 1
            coordinateValueY = 0
            coordinateValueZ = 0
        }
        
        let value = CGFloat.pi / 180 * CGFloat(sender.value) / 1000
        identity = CATransform3DRotate(identity, value, coordinateValueX, coordinateValueY, coordinateValueZ)
        containerView.layer.sublayerTransform = identity
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    fileprivate func initView() {
        identity = CATransform3DIdentity
        identity.m34 = m34Value
        
        //test
        identity = CATransform3DRotate(identity, -(CGFloat.pi / 4), 1, 0, 0)
        identity = CATransform3DRotate(identity, -(CGFloat.pi / 4), 0, 1, 0)
        
        containerView.layer.sublayerTransform = identity
        
        var transform = CATransform3DMakeTranslation(0, 0, 120)
        num1View.layer.transform = transform
        
        transform = CATransform3DMakeTranslation(120, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat.pi / 2, 0, 1, 0)
        num2View.layer.transform = transform
        
        transform = CATransform3DMakeTranslation(0, -120, 0)
        transform = CATransform3DRotate(transform, CGFloat.pi / 2, 1, 0, 0)
        num3View.layer.transform = transform
        
        transform = CATransform3DMakeTranslation(0, 120, 0)
        transform = CATransform3DRotate(transform, -(CGFloat.pi / 2), 1, 0, 0)
        num4View.layer.transform = transform
        
        transform = CATransform3DMakeTranslation(-120, 0, 0)
        transform = CATransform3DRotate(transform, -(CGFloat.pi / 2), 0, 1, 0)
        num5View.layer.transform = transform
        
        transform = CATransform3DMakeTranslation(0, 0, -120)
        transform = CATransform3DRotate(transform, CGFloat.pi, 0, 1, 0)
        num6View.layer.transform = transform
    }
}
