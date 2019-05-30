//
//  VideoModel.swift
//  Dappmovie
//
//  Created by GEM on 3/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    var videosId: String
    var videosIso6391: String
    var videosIso31661: String
    var videosKey: String
    var videosName: String
    var videosSite: String
    var videosSize: Int
    var videosType: String
    
    init(_ dto: VideoDTO) {
        videosId = dto.videosId
        videosIso6391 = dto.videosIso6391
        videosIso31661 = dto.videosIso31661
        videosKey = dto.videosKey
        videosName = dto.videosName
        videosSite = dto.videosSite
        videosSize = dto.videosSize
        videosType = dto.videosType
    }
}
