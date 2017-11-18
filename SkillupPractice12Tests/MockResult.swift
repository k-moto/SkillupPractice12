//
//  MockResult.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/11/18.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper

@testable import SkillupPractice12

class MockResult {
    func parseMockJsonData() -> ShopItem? {
        
        let bundle = Bundle(for: type(of: self))
        let filePath = bundle.path(forResource: "mock", ofType: "json")
        
        guard let path = filePath else {
            return nil
            
        }
        
        let fileHandle = FileHandle(forReadingAtPath: path)
        let readJsonData = fileHandle?.readDataToEndOfFile()
        
        guard let jsonData = readJsonData else {
            fatalError("テストデータが読み込めない")
            
        }
        
        let strJson = String(data: jsonData,
                             encoding: String.Encoding.utf8)
        
        guard let json = strJson else {
            fatalError("テストデータが読み込めない")
            
        }
        
        if let searchResult = Mapper<ShopItem>().map(JSONString: json) {
            return searchResult
            
        }
        
        fatalError("テストデータが読み込めない")
        
    }
}
