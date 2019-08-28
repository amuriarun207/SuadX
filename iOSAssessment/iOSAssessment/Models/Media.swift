//
//  Media.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Media {
    var type: String?
    var subtype: String?
    var caption, copyright: String?
    var approvedForSyndication: Int?
    var mediaMetaData: [MediaMetaData]?
    init(data: JSON) {
        self.type = data[CodingKeys.type.rawValue].string ?? self.type
        self.subtype = data[CodingKeys.subtype.rawValue].string ?? self.subtype
        self.caption = data[CodingKeys.caption.rawValue].string ?? self.caption
        self.copyright = data[CodingKeys.copyright.rawValue].string ?? self.copyright
        self.approvedForSyndication = data[CodingKeys.approvedForSyndication.rawValue].int ?? self.approvedForSyndication
        self.mediaMetaData = MediaMetaData.parseMediaMetaDatCollection(mediaMetaDataCollection: data[CodingKeys.mediaMetaData.rawValue].arrayValue)
    }
    enum CodingKeys: String {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetaData = "media-metadata"
    }
}
extension Media{
    static func parseMediaDataCollection(mediaCollection:  [SwiftyJSON.JSON]) -> [Media]{
        var  mediaArray = [Media]()
        for resultsObject in mediaCollection{
            mediaArray.append(Media(data: resultsObject))
        }
        return mediaArray
    }
}
