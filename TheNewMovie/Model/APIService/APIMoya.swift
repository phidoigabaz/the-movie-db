//
//  APIMoya.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/29/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

var shouldTimeout: (() -> (Bool))?

struct Network {
    static let provider = MoyaProvider<MyService>(endpointClosure: failureEndpointClosure)
    
    static func request(
        target: MyService,
        success successCallback: @escaping (JSON) -> Void,
        error errorCallback: @escaping (_ statusCode: Int) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
        ) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    try response.filterSuccessfulStatusCodes()
                    let json = try JSON(response.mapJSON())
                    successCallback(json)
                }
                catch let error {
                    errorCallback(error as! Int)
                }
            case let .failure(error):
               failureCallback(error)
            }
        }
    }
}

let apiProviderMoya = MoyaProvider<MyService>(endpointClosure: failureEndpointClosure)

let failureEndpointClosure = { (target: MyService) -> Endpoint in
    let sampleResponseClosure = { () -> (EndpointSampleResponse) in
        if (shouldTimeout != nil) {
            return .networkError(NSError())
        } else {
            return .networkResponse(APICode.success.rawValue, target.sampleData)
        }
    }
    return Endpoint(url: "\(URL(target: target))",
        sampleResponseClosure: sampleResponseClosure,
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers)
}


extension MyService: TargetType {
    var baseURL: URL {
         return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .getMovieTrending():
            return "/trending/movie/day"
        case .getMovieDetail(let id):
            return "/movie/\(id)"
        case .getMovieCast(let id):
            return "movie/\(id)/credits"
        case .searchMovie:
            return "/search/movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovieTrending,
             .getMovieCast,
             .getMovieDetail,
             .searchMovie:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getMovieTrending:
            return "trending".utf8Encoded
        case .getMovieDetail:
            return "detail".utf8Encoded
        case .getMovieCast:
            return "cast".utf8Encoded
        case .searchMovie:
            return "search".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case .getMovieTrending:
            return .requestParameters(parameters: ["api_key" : Constants.API_KEY],
                                      encoding: URLEncoding.queryString)
        case .getMovieDetail:
            return .requestParameters(parameters: ["api_key" : Constants.API_KEY, "append_to_response": "videos"],
                                      encoding: URLEncoding.queryString)
        case .getMovieCast(_):
            return .requestParameters(parameters: ["api_key" : Constants.API_KEY],
                                      encoding: URLEncoding.queryString)
        case .searchMovie(let query):
            return .requestParameters(parameters: ["api_key" : Constants.API_KEY, "query": "\(query.replacingOccurrences(of: " ", with: "%20"))"],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

