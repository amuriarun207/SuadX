//
//  MediaMetaData.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MediaMetaData {
        var url: String?
        var format: String?
        var height, width: Int?
    init(data: JSON) {
        self.url = data[CodingKeys.url.rawValue].string ?? self.url
        self.format = data[CodingKeys.format.rawValue].string ?? self.format
        self.height = data[CodingKeys.height.rawValue].int ?? self.height
        self.width = data[CodingKeys.width.rawValue].int ?? self.width
    }
    enum CodingKeys: String{
        case url,format,height,width
    }
}

//enum Format: String, Codable {
//    case jumbo = "Jumbo"
//    case large = "Large"
//    case largeThumbnail = "Large Thumbnail"
//    case mediumThreeByTwo210 = "mediumThreeByTwo210"
//    case mediumThreeByTwo440 = "mediumThreeByTwo440"
//    case normal = "Normal"
//    case square320 = "square320"
//    case square640 = "square640"
//    case standardThumbnail = "Standard Thumbnail"
//    case superJumbo = "superJumbo"
//}
extension MediaMetaData{
    static func parseMediaMetaDatCollection(mediaMetaDataCollection:  [SwiftyJSON.JSON]) -> [MediaMetaData]{
        var  mediaMetaDataArray = [MediaMetaData]()
        for resultsObject in mediaMetaDataCollection{
            mediaMetaDataArray.append(MediaMetaData(data: resultsObject))
        }
        return mediaMetaDataArray
    }
}
