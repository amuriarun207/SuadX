//
//  RequestFactory.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
final class RequestFactory {
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

enum Router {
    
    case emailed
    case shared
    case viewed
    
    fileprivate var httpMethod: String {
        return "GET"
    }
    private var queryParameter: [URLQueryItem] {
        return [URLQueryItem(name: "api-key", value: NYApiKey)]
    }
    var baseURLString: String {
        return "https://api.nytimes.com/svc/mostpopular/v2/\(self)/"
    }
    
    func urlRequest(for periodOfDays: Int) -> URLRequest? {
        let baseUrlString = baseURLString + "\(periodOfDays).json"
        
        var urlComponents = URLComponents(string: baseUrlString)
        urlComponents?.queryItems = queryParameter
        guard let url = urlComponents?.url else { return nil }
        
        var routerUrlRequest = URLRequest(url: url)
        routerUrlRequest.httpMethod = httpMethod
        return routerUrlRequest
    }
}
