//
//  AreaTableView.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

class AreaTableView:NSObject, UITableViewDataSource {
    
    var dataList: [AreaItem] = []

    
    func add(dataList: [AreaItem]){
        self.dataList = dataList
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AreaTableViewCell.identifier,for: indexPath) as! AreaTableViewCell
        cell.areaNameLabel.text = dataList[indexPath.row].areanameL
        
        return cell
        
    }
    
}
