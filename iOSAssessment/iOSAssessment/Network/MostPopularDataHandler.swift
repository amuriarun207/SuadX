//
//  MostPopularDataHandler.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
class MostPopularDataHandler: RequestHandler{
    var mostPopularNewsdetails: MostPopularNews?
    var task : URLSessionTask?
    
    func loadMostPopularNews(for category: Router, period: Int, completion: @escaping(_ mostpopularElements : MostPopularNews?) -> Void) {
        
        guard let urlReq = category.urlRequest(for: period) else {
            completion(nil)
            return
        }
        
        task = RequestService().loadData(urlRequest: urlReq, completion: self.networkResult(completion: { (result) in
            switch result {
            case .success(let data) :
                self.mostPopularNewsdetails = self.parseData(data: data)
                break
            case .failure(let error) :
                print("Network error \(error)") //not handled 
                break
            }
             completion(self.mostPopularNewsdetails)
        }))
    }
}
