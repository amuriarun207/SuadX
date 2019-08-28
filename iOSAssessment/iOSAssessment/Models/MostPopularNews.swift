//
//  MostPopularNews.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
import SwiftyJSON
struct MostPopularNews {
    let status, copyright: String?
    let numResults: Int?
    let results: [Results]?
    
    init(data: JSON) {
        self.copyright = data[CodingKeys.copyright.rawValue].string ?? nil
        self.status = data[CodingKeys.status.rawValue].string ?? nil
        self.numResults = data[CodingKeys.numResults.rawValue].int ?? 0
        self.results = Results.parseResultsCollection(resultsCollection: data[CodingKeys.results.rawValue].arrayValue)
    }
    enum CodingKeys: String {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}
