//
//  CATypeModel.swift
//  DemoGroup
//
//  Created by Shi Feng on 2018/11/7.
//  Copyright © 2018 Shi Feng. All rights reserved.
//

import Foundation

struct CATypeModel {
    var name: String = ""
    var subTypeArray: [CASubTypeModel] = []
    init(name: String, subTypeArray: Array<CASubTypeModel>) {
        self.name = name
        self.subTypeArray = subTypeArray
    }
}

struct CASubTypeModel {
    var name: String = ""
    init() {
        self.name = ""
    }
    init(name: String) {
        self.name = name
    }
}
