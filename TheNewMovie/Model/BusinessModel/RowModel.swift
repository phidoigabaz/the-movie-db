//
//  TrendingModel.swift
//  Dappmovie
//
//  Created by admin on 2/20/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class RowModel: NSObject {
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
    
    init(_ dto: RowDTO) {
        adult = dto.adult
        backdropPath = dto.backdropPath
        genreIDS = dto.genreIDS
        id = dto.id
        originalLanguage = dto.originalLanguage
        originalTtitle = dto.originalTtitle
        overview = dto.overview
        posterPath = dto.posterPath
        releaseDate = dto.releaseDate
        title = dto.title
        video = dto.video
        voteAverage = dto.voteAverage
        voteCount = dto.voteCount
        popularity = dto.popularity
    }
}
