//
//  ShopTableViewCellTest.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/11/18.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper

@testable import SkillupPractice12

class ShopTableViewCellTest: XCTestCase {
    
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: ShopTableViewCell!
    var shopItem: ShopItem? = MockResult().parseMockJsonData()
    
    override func setUp() {
        super.setUp()
        let dummyAreaItem = AreaItem(map: Map(mappingType: .fromJSON,
                                              JSON: ["": ""]))!
        let controller = ShopViewController.createVC(areaItem: dummyAreaItem)
        
        _ = controller.view
        
        tableView = controller.shopTable
        tableView?.dataSource = dataSource
        
        let cellID = ShopTableViewCell.identifier
        let indexPath = IndexPath(row: 0, section: 0)
        cell = tableView.dequeueReusableCell(withIdentifier: cellID,
                                             for: indexPath) as! ShopTableViewCell
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testSetShopItem(){
        guard let item = shopItem else {
            XCTAssert(false)
            return
            
        }
        
        cell.shopItem = item
        
        XCTAssertEqual(cell.shopName.text, "和食個室×しゃぶしゃぶ鍋 にっぽん市 池袋店")
        XCTAssertEqual(cell.nearest.text, "池袋駅　3分")
        XCTAssertEqual(cell.address.text, "〒171-0021 東京都豊島区西池袋1-38-1 池袋YSステージ8F")
        XCTAssertEqual(cell.tell.text, "050-3464-1356")
        XCTAssertEqual(cell.budget.text, "¥2,980")
        
    }
    
}

extension ShopTableViewCellTest {
    
    class FakeDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
