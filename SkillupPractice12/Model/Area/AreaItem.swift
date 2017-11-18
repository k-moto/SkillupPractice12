//
//  AreaItem.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import ObjectMapper

struct AreaItem: Mappable {
    
    var areacodeL = ""
    var areanameL = ""
    var prefCode = ""
    var prefName = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        areacodeL <- map["areacode_l"]
        areanameL <- map["areaname_l"]
        prefCode <- map["pref.pref_code"]
        prefName <- map["pref.pref_name"]

    }
}
