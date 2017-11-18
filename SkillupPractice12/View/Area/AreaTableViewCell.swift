//
//  AreaTableViewCell.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

final class AreaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var areaNameLabel: UILabel!
    
    static var identifier: String {
        get {
            return String(describing: self)
            
        }
    }
    
}
