//
//  APIClient.swift
//  SkillupPractice12
//
//  Created by k_motoyama on 2017/04/22.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import Alamofire

enum Path: String {
    case shop = "/RestSearchAPI/20150630/"
}

enum Result {
    case success(Any)
    case failure(Error)
}

class APIClient {
    
    let base = "https://api.gnavi.co.jp"
    var url: String
    
    init(path: Path, param: String){
        
        url = base + path.rawValue + param
    }
    
    func request(completionHandler: @escaping (Result) -> Void = {_ in }) {
        
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                completionHandler(Result.success(value))
                
            case .failure:
                
                if let error = response.result.error {
                    completionHandler(Result.failure(error))
                } else {
                    fatalError("エラーのインスタンスがnil")
                }
            }
            
        }
    }
}
