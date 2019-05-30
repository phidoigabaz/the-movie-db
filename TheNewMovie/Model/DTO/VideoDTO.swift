//
//  VideoDTO.swift
//  Dappmovie
//
//  Created by GEM on 3/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class VideoDTO: NSObject {
    var videosId: String
    var videosIso6391: String
    var videosIso31661: String
    var videosKey: String
    var videosName: String
    var videosSite: String
    var videosSize: Int
    var videosType: String
    
    init(_ json: JSON) {
        videosId = json["id"].stringValue
        videosIso6391 = json["iso_639_1"].stringValue
        videosIso31661 = json["iso_3166_1"].stringValue
        videosKey = json["key"].stringValue
        videosName = json["name"].stringValue
        videosSite = json["site"].stringValue
        videosSize = json["size"].intValue
        videosType = json["type"].stringValue
    }
}
