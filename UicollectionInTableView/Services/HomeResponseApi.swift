//
//  ItemApi.swift
//  CartlowApi
//
//  Created by fahad rasheed on 05/09/2020.
//  Copyright © 2020 fahad rasheed. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeResponseApi {
    
    func getUrl(completion: @escaping  HomeResponseCompletion ) {
        guard  let url = URL(string:BASE_URL   ) else {return}
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                
                completion(nil)
                
                return
            }
            guard let data = response.data else {return completion(nil)}
            
            let jsonDecoder = JSONDecoder()
           // let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data!)
            
            do {
               
                let homeResponse = try jsonDecoder.decode(HomeResponse.self, from: data)
                completion(homeResponse)
            }catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
            
            
        }
    }
// func   parseSwityJson(json: JSON) -> Products{
//
//    let name =  json["sections"].arrayValue.map({$0.stringValue})
//
//    return Products( prodcutName: name)
//    }
    
    
}
