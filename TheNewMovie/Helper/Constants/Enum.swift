//
//  Enum.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/27/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

enum APICode: Int {
    case success = 200
    case invalidAPIkey = 401
    case notBeFound = 404
}

enum MyService {
    case getMovieTrending()
    case getMovieDetail(_ id: Int)
    case getMovieCast(_ id: Int)
    case searchMovie(_ query: String)
}
