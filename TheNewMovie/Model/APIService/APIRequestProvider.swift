//
//  APIRequestProvider.swift
//  5dmax
//
//  Created by Huy Nguyen on 1/4/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

let kClientVersionHeaderField = "os_version_code"
let kClientOSHeaderField = "os_type"


let baseURL = "https://api.themoviedb.org" //-> movie
let apiVersion = "/3"

/*
 *  APIRequestProvider takes responsible for build and provide request for service objects
 *  default header for request will be defined here
 */
class APIRequestProvider: NSObject {

    //mark: SINGLETON
    static var shareInstance: APIRequestProvider = {
        let instance = APIRequestProvider()
        return instance
    }()

    //mark: DEFAULT HEADER & REQUEST URL
    private var _headers: HTTPHeaders = [:]
    var headers: HTTPHeaders {
        set {
            _headers = headers
        }
        get {
            let headers: HTTPHeaders = [
                "Authorization": "",
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded",
            ]

            return headers
        }
    }
    
    private var _headersSpot: HTTPHeaders = [:]
    var headersSpot: HTTPHeaders {
        set {
            _headersSpot = headersSpot
        }
        get {
            let imei = UIDevice.current.identifierForVendor?.uuidString
            let authorization = "Bearer " + imei!
            let headersSpot: HTTPHeaders = [
                "Authorization": authorization,
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
            
            return headersSpot
        }
    }

    func commonParam() -> [String: String] {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let deviceOS = "ios"
        var param = [String: String]()
        param[kClientVersionHeaderField] = version
        param[kClientOSHeaderField] = deviceOS
        return param
    }
    
    private var _requestURL: String = baseURL
    var requestURL: String {
        set {
            _requestURL = requestURL
        }
        get {
            var url = _requestURL
            url.append("\(apiVersion)/")
            return url
        }
    }

    var alamoFireManager: SessionManager

    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 30 // seconds for testing

        alamoFireManager = SessionManager(configuration: configuration)
    }

    //mark: -- Authorization Requests
    
    
    //MARK: HOME
    func getMovieTrending() -> DataRequest {
        let urlString = requestURL.appending("trending/movie/day")
        var param = commonParam()
        param["api_key"] = Constants.API_KEY
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
    
    func getMoviePopular() -> DataRequest {
        let urlString = requestURL.appending("movie/upcoming")
        var param = commonParam()
        param["api_key"] = Constants.API_KEY
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
    
    //MARK: DETAIL
    
    func getMovieDetail(id: Int, videos: String) -> DataRequest {
        let urlString = requestURL.appending("movie/\(id)")
        var param = commonParam()
        param["api_key"] = "\(Constants.API_KEY)"
        param["append_to_response"] = "\(videos)"
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
    
    func getMovieDetailReviews(id: Int) -> DataRequest { // -> id = movie_id
        let urlString = requestURL.appending("movie/\(id)/reviews")
        var param = commonParam()
        param["api_key"] = Constants.API_KEY
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
    
    func getMovieDetailCast(id: Int) -> DataRequest { // -> id = movie_id
        let urlString = requestURL.appending("movie/\(id)/credits")
        var param = commonParam()
        param["api_key"] = Constants.API_KEY
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
    
    //MARK: Review detail
    func getRecommendationMovie(_ id: Int) -> DataRequest {
        let urlString = requestURL.appending("movie/\(id)/recommendations")
        var param = commonParam()
        param["api_key"] = Constants.API_KEY
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
}
