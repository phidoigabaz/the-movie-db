//
//  MovieDetailDTO.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class MovieDetailDTO: NSObject {
    var adult: Bool
    var backdropPath: String
    //var belongsToCollection: String
    var budget: Int
    var genres: [KindDTO] = []
    var homepage: String
    var id: Int
    var imdbID: String
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var productionCompanies: [ProductionCompaniesDTO] = []
    var productionCountries: [ProductionCountryDTO] = []
    var releaseDate: String
    var revenue: Int
    var runtime: Int
    var status: String
    var tagline: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    var videos: [VideoDTO] = []
    
    init(_ json: JSON) {
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].stringValue
        budget = json["budget"].intValue
        for (_ ,subJson) in json["genres"] {
            let dto = KindDTO(subJson)
            genres.append(dto)
        }
        
        homepage = json["homepage"].stringValue
        id = json["id"].intValue
        imdbID = json["imdb_id"].stringValue
        originalLanguage = json["original_language"].stringValue
        originalTitle = json["original_title"].stringValue
        overview = json["overview"].stringValue
        popularity = json["popularity"].doubleValue
        posterPath = json["poster_path"].stringValue
        for (_ ,subJson) in json["production_companies"] {
            let dto = ProductionCompaniesDTO(subJson)
            productionCompanies.append(dto)
        }
        
        for (_ ,subJson) in json["production_countries"] {
            let dto = ProductionCountryDTO(subJson)
            productionCountries.append(dto)
        }
        
        releaseDate = json["release_date"].stringValue
        revenue = json["revenue"].intValue
        runtime = json["runtime"].intValue
        status = json["status"].stringValue
        tagline = json["tagline"].stringValue
        title = json["title"].stringValue
        video = json["video"].boolValue
        voteAverage = json["vote_average"].doubleValue
        voteCount = json["vote_count"].intValue
        
        for (_ ,subJson) in json["videos"]["results"] {
            let dto = VideoDTO(subJson)
            videos.append(dto)
        }
        
    }
}
