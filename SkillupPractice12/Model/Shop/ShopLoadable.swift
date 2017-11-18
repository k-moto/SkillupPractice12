//
//  ShopLoadable.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation

enum ShopStatus {
    case none
    case nomal(ShopResult)
    case noData
    case error(Error)
}

protocol ShopLoadable {
    func setResult(result: ShopStatus)
    
}
