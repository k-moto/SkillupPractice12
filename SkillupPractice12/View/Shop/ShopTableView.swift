//
//  ShopTableViewCell.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

class ShopTableView: NSObject, UITableViewDataSource {
    
    var shopList: [ShopItem] = []
    
    func add(shopList: [ShopItem]){
        self.shopList = shopList
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = ShopTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID,
                                                 for: indexPath) as! ShopTableViewCell
        let shopItem = shopList[indexPath.row]
        
        cell.shopItem = shopItem
        
        return cell
    }
    
}
