//
//  AreaLoadable.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation

enum AreaStatus {
    case none
    case nomal(AreaResult)
    case noData
    case error()
}

protocol AreaLoadable {
    func setResult(result: AreaStatus)
}
