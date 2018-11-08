//
//  CoreAnimationViewController.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/6.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import UIKit

class CoreAnimationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var typeArray: [CATypeModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CATypeCell", bundle: nil), forCellReuseIdentifier: "CATypeCell")
        initTypeModel()
    }
    
    fileprivate func initTypeModel() {
        let layerTree_layerAndPic = CASubTypeModel(name: "图层与视图")
        let layerTree_layerAbility = CASubTypeModel(name: "图层的能力")
        let layerTree_useLayer = CASubTypeModel(name: "使用图层")
        let layerTreeArray = [layerTree_layerAndPic,
                              layerTree_layerAbility,
                              layerTree_useLayer]
        let layerTree = CATypeModel(name: "图层树", subTypeArray: layerTreeArray)
        typeArray.append(layerTree)
        
        let layerPic_contents = CASubTypeModel(name: "Contents属性")
        let layerPic_customDrawing = CASubTypeModel(name: "Custom Drawing")
        let layerPicArray = [layerPic_contents,
                             layerPic_customDrawing]
        let layerPic = CATypeModel(name: "寄宿图", subTypeArray: layerPicArray)
        typeArray.append(layerPic)
        
        let layerGeometry_layout = CASubTypeModel(name: "布局")
        let layerGeometry_anchor = CASubTypeModel(name: "锚点")
        let layerGeometry_coordinate = CASubTypeModel(name: "坐标系")
        let layerGeometry_hitTest = CASubTypeModel(name: "Hit Testing")
        let layerGeometry_autoLayout = CASubTypeModel(name: "自动布局")
        let layerGeometryArray = [layerGeometry_layout,
                                  layerGeometry_anchor,
                                  layerGeometry_coordinate,
                                  layerGeometry_hitTest,
                                  layerGeometry_autoLayout]
        let layerGeometry = CATypeModel(name: "图层几何学", subTypeArray: layerGeometryArray)
        typeArray.append(layerGeometry)
        
        let layerVisualEffect_cornerRadius = CASubTypeModel(name: "圆角")
        let layerVisualEffect_border = CASubTypeModel(name: "图层边框")
        let layerVisualEffect_shadow = CASubTypeModel(name: "阴影")
        let layerVisualEffect_mask = CASubTypeModel(name: "图层蒙版")
        let layerVisualEffect_strechAndFilter = CASubTypeModel(name: "拉伸过滤")
        let layerVisualEffect_lucid = CASubTypeModel(name: "组透明")
        let layerVisualEffectArray = [layerVisualEffect_cornerRadius,
                                      layerVisualEffect_border,
                                      layerVisualEffect_shadow,
                                      layerVisualEffect_mask,
                                      layerVisualEffect_strechAndFilter,
                                      layerVisualEffect_lucid]
        let layerVisualEffect = CATypeModel(name: "视觉效果", subTypeArray: layerVisualEffectArray)
        typeArray.append(layerVisualEffect)
        
        let layerTransform_affine = CASubTypeModel(name: "仿射变换")
        let layerTransform_3d = CASubTypeModel(name: "3D变换")
        let layerTransform_certainObject = CASubTypeModel(name: "固体对象")
        let layerTransformArray = [layerTransform_affine,
                                   layerTransform_3d,
                                   layerTransform_certainObject]
        let layerTransform = CATypeModel(name: "变换", subTypeArray: layerTransformArray)
        typeArray.append(layerTransform)
        
        tableView.reloadData()
    }
}

extension CoreAnimationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if typeArray[indexPath.section].subTypeArray[indexPath.row].name == "3D变换" {
            let vc = CoreAnimation_Transform_3d_ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if typeArray[indexPath.section].subTypeArray[indexPath.row].name == "固体对象" {
            let vc = CoreAnimation_Transform_certainObject_ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension CoreAnimationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return typeArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArray[section].subTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return typeArray[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CATypeCell", for: indexPath) as! CATypeCell
        cell.textLabel?.text = typeArray[indexPath.section].subTypeArray[indexPath.row].name
        return cell
    }
}
