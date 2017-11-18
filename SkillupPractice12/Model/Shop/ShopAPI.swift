//
//  ShopAPI.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import ObjectMapper

final class ShopAPI {
    
    var loadable: ShopLoadable?
    
    func fetch(areaCodeL: String, pref: String, perPage: String, offset: Int) {
        
        let keyid = "6adca4e8fb42567521066a6337d0c72d"
        let format = "json"
        
        let getParam = "?keyid=\(keyid)&format=\(format)&areacode_l=\(areaCodeL)&pref=\(pref)&hit_per_page=\(perPage)&offset_page=\(offset)"
        
        let client = APIClient(path: .shop, param: getParam)
        
        client.request() { [weak self] (response) in
            
            switch response {
            case .success(let result) :
                
                if let searchResult = Mapper<ShopResult>().map(JSONObject: result) {
                    
                    if let result = self?.setResult(result: searchResult) {
                        self?.loadable?.setResult(result: result)
                    }
                }
                break
                
            case .failure(let error):
                self?.loadable?.setResult(result: .error(error))
                break
            }
        }
    }
    
    private func setResult(result: ShopResult) -> ShopStatus {
        return result.rest.isEmpty ? .noData : .nomal(result)
        
    }
}
