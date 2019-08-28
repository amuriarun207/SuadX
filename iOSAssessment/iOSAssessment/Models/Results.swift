//
//  Results.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Results {
    var url: String?
    var adxKeywords: String?
    var column: String?
    var section: String? //need to do
    var byline: String?
    var type: String?
    var title, abstract, publishedDate: String?
    var source: String?
    var id, assetID, views: Int?
    var desFacet, orgFacet, perFacet, geoFacet: [Any]?
    var media: [Media]? //need to do
    init(data: JSON) {
        self.url = data[CodingKeys.url.rawValue].string ?? self.url
        self.adxKeywords = data[CodingKeys.adxKeywords.rawValue].string ?? self.adxKeywords
        self.column = data[CodingKeys.column.rawValue].string ?? self.column
        self.byline = data[CodingKeys.byline.rawValue].string ?? self.byline
        self.type = data[CodingKeys.type.rawValue].string ?? self.type
        self.title = data[CodingKeys.title.rawValue].string ?? self.title
        self.abstract = data[CodingKeys.abstract.rawValue].string ?? self.abstract
        self.publishedDate = data[CodingKeys.publishedDate.rawValue].string ?? self.publishedDate
        self.source = data[CodingKeys.source.rawValue].string ?? self.source
        self.id = data[CodingKeys.id.rawValue].int ?? self.id
        self.assetID = data[CodingKeys.assetID.rawValue].int ?? self.assetID
        self.views = data[CodingKeys.views.rawValue].int ?? self.views
        self.desFacet = data[CodingKeys.desFacet.rawValue].arrayObject ?? self.desFacet
        self.orgFacet = data[CodingKeys.orgFacet.rawValue].arrayObject ?? self.orgFacet
        self.perFacet = data[CodingKeys.perFacet.rawValue].arrayObject ?? self.perFacet
        self.geoFacet = data[CodingKeys.geoFacet.rawValue].arrayObject ?? self.geoFacet
        self.section = data[CodingKeys.section.rawValue].string ?? self.section
        self.media = Media.parseMediaDataCollection(mediaCollection: data[CodingKeys.media.rawValue].arrayValue)
    }
    static func parseResultsCollection(resultsCollection:  [SwiftyJSON.JSON]) -> [Results]{
        var  resultsArray = [Results]()
        for resultsObject in resultsCollection{
            resultsArray.append(Results(data: resultsObject))
        }
        return resultsArray
    }
    enum CodingKeys: String {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, type, title, abstract
        case publishedDate = "published_date"
        case source, id
        case assetID = "asset_id"
        case views
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
    }
}

