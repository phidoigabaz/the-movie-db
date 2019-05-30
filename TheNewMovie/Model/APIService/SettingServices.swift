//
//  SettingServices.swift
//  PamZ
//
//  Created by admin on 10/30/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import SwiftyJSON

class SettingService: APIServiceObject {
    func getMovieTrending(completion: @escaping(([RowModel], NSError?) -> Void)) {
        let request = APIRequestProvider.shareInstance.getMovieTrending()
        self.serviceAgent.startRequest(request) { (_ json: JSON, _ error: NSError?) in
            if error == nil {
                var models = [RowModel]()
                for subJson in json.arrayValue {
                    let dto = RowDTO(subJson)
                    let model = RowModel(dto)
                    models.append(model)
                }
                completion(models, nil)
            } else {
                completion([RowModel](),error)
            }
        }
        
        addToQueue(request)
    }
    
    func getMovieDetail(id: Int,completion: @escaping(([MovieDetailModel], NSError?) -> Void)) {
        let request = APIRequestProvider.shareInstance.getMovieDetail(id: id, videos: "videos")
        self.serviceAgent.starRequestDetail(request) { (_ json: JSON, error: NSError?) in
            if error == nil {
                var models = [MovieDetailModel]()
                let dto = MovieDetailDTO(json)
                let model = MovieDetailModel(dto)
                models.append(model)
                completion(models,nil)
            } else {
                completion([MovieDetailModel](), error)
            }
        }
        addToQueue(request)
    }
    
    func getMovieDetailCredit(id: Int,completion: @escaping(([CastModel],NSError?) -> Void)) {
        let request = APIRequestProvider.shareInstance.getMovieDetailCast(id: id)
        serviceAgent.starRequestDetail(request) { (_ json: JSON, _ err: NSError?) in
            if err == nil {
                var models = [CastModel]()
                for subJson in json["cast"].arrayValue {
                    let dto = CastDTO(subJson)
                    let model = CastModel(dto)
                    models.append(model)
                }
                completion(models, nil)
            } else {
                completion([CastModel](), err)
            }
        }
        addToQueue(request)
    }
    
    func searchMovie(_ query: String, completion: @escaping(([RowModel], NSError?) -> Void)) {
        
    }
}
