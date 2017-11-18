//
//  AreaJsonReader.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Foundation
import ObjectMapper

class AreaJsonReader {
    
    var loadable: AreaLoadable?
    
    func parseJsonData() {
        
        let bundle = Bundle(for: type(of: self))
        let filePath = bundle.path(forResource: "area", ofType: "json")
        
        guard let path = filePath else {
            return
            
        }
        
        let fileHandle = FileHandle(forReadingAtPath: path)
        let readJsonData = fileHandle?.readDataToEndOfFile()
        
        guard let jsonData = readJsonData else {
            self.loadable?.setResult(result: .error())
            return
        }
        
        let strJson = String(data: jsonData,
                             encoding: String.Encoding.utf8)
        
        guard let json = strJson else {
            return
            
        }
        
        if let searchResult = Mapper<AreaResult>().map(JSONString: json) {
            let result = self.setResult(result: searchResult)
            self.loadable?.setResult(result: result)
            return
            
        }
        
    }
    
    private func setResult(result: AreaResult) -> AreaStatus {
        return result.gareaLarge.isEmpty ? .noData : .nomal(result)
    }
}
