//
//  ShopTableViewCell.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

final class ShopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopThumbnail: UIImageView!
    @IBOutlet weak var nearest: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var tell: UILabel!
    @IBOutlet weak var budget: UILabel!
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
    var shopItem: ShopItem? {
        didSet {
            
            guard let item = shopItem else {
                return
                
            }
            
            shopName.text = item.name
            
            // 画像があったら表示、無かったらnoimage
            if let url = URL.init(string: item.shopImage1) {
                shopThumbnail.af_setImage(withURL: url)
                
            } else {
                shopThumbnail.image = UIImage(named:"noimage")
                
            }
            
            let nearestText =  "\(item.station)　\(item.walk)分"
            nearest.text = nearestText
            
            address.text = item.address
            tell.text = item.tel
            
            if let dispBudget = Int(item.budget) {
                budget.text = "¥\(dispBudget.decimalStr)"
                
            }
            
        }
    }
    
}
