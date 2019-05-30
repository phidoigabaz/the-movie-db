//
//  MovieDetailModel.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MovieDetailModel: NSObject {
    var adult: Bool
    var backdropPath: String
    //var belongsToCollection: String
    var budget: Int
    var genres: [KindModel] = []
    var homepage: String
    var id: Int
    var imdbID: String
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var productionCompanies: [ProductionCompaniesModel] = []
    var productionCountries: [ProductionCountryModel] = []
    var releaseDate: String
    var revenue: Int
    var runtime: Int
    var status: String
    var tagline: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    var videos: [VideoModel] = []
    
//    "id": "5c6d23b30e0a267f9d98cdff",
//    "iso_639_1": "en",
//    "iso_3166_1": "US",
//    "key": "g4Hbz2jLxvQ",
//    "name": "SPIDER-MAN: INTO THE SPIDER-VERSE - Official Trailer (HD)",
//    "site": "YouTube",
//    "size": 1080,
//    "type": "Trailer"
    
    init(_ dto: MovieDetailDTO) {
        adult = dto.adult
        backdropPath = dto.backdropPath
        budget = dto.budget
        for dto in dto.genres {
            genres.append(KindModel(dto))
        }
        homepage = dto.homepage
        id = dto.id
        imdbID = dto.imdbID
        originalLanguage = dto.originalLanguage
        originalTitle = dto.originalTitle
        overview = dto.overview
        popularity = dto.popularity
        posterPath = dto.posterPath
        for dto in dto.productionCompanies {
            productionCompanies.append(ProductionCompaniesModel(dto))
        }
        for dto in dto.productionCountries {
            productionCountries.append(ProductionCountryModel(dto))
        }
        releaseDate = dto.releaseDate
        revenue = dto.revenue
        runtime = dto.runtime
        status = dto.status
        tagline = dto.tagline
        title = dto.title
        video = dto.video
        voteAverage = dto.voteAverage
        voteCount = dto.voteCount
        for dto in dto.videos {
            videos.append(VideoModel(dto))
        }
    }
}
