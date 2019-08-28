//
//  RequestHandler.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//


import Foundation
import SwiftyJSON

class RequestHandler {
    let reachability = Reachability()!
    func networkResult<T>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<T, ErrorResult>) -> Void) {
            return { dataResult in
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        completion(.success(data))
                        break
                    case .failure(let error) :
                        print("Network error \(error)")
                        completion(.failure(.network(string: "Network error " + error.localizedDescription)))
                        break
                    }
                })
                
            }
    }
     func parseData<T>(data:T ) -> MostPopularNews?{
        print("data ins parasedata: \(data)")
        do{
        //    if let result = try JSONSerialization.jsonObject(with: data as! Data, options: []) as? [String: AnyObject] {
            let json = try JSON(data: data as! Data)
            return MostPopularNews(data: json)
          }
            catch {
                // can't parse json
                print("cant parse the json")
                return nil
            }
        
    }
}
