//
//  TrendingDTO.swift
//  Dappmovie
//
//  Created by admin on 2/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class RowDTO: NSObject {
    var adult: Bool
    var backdropPath: String
    var genreIDS: [Int] = []
    var id: Int
    var originalLanguage: String
    var originalTtitle: String
    var overview: String
    var posterPath: String
    var releaseDate: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
    
    init(_ json: JSON) {
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].stringValue
        genreIDS = [json["genre_ids"].intValue]
        id = json["id"].intValue
        originalLanguage = json["original_language"].stringValue
        originalTtitle = json["original_title"].stringValue
        overview = json["overview"].stringValue
        posterPath = json["poster_path"].stringValue
        releaseDate = json["release_date"].stringValue
        title = json["title"].stringValue
        video = json["video"].boolValue
        voteAverage = json["vote_average"].doubleValue
        voteCount = json["vote_count"].intValue
        popularity = json["popularity"].doubleValue
    }
}
