//
//  ShopResult.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import ObjectMapper

struct ShopResult: Mappable {
    
    var rest: [ShopItem] = []
    var hitCount = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        rest <- map["rest"]
        hitCount <- map["total_hit_count"]

    }
}
