//
//  HomeViewModel.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/27/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import UIKit
import Toast
import Reachability
import SwiftyJSON

class HomeViewModel {
    
    var settingService = SettingService()
    var rowModel: [RowModel] = []
    var movies: [MoviesModel] = []
    
    //MARK: Moya
    
    var updateLoadingStatus: (() -> ())?
    
    var isLoading: Bool = false {
        didSet {
            updateLoadingStatus? ()
        }
    }
    
    //MARK: Get data
    func getMovieTrending(_ view: UIView, completion: @escaping(([RowModel]) -> Void)) {
        if let reachability = Reachability(), reachability .connection != .none {
            self.settingService.cancelAllRequests()
            self.isLoading = true
            self.settingService.getMovieTrending { (model, err) in
                if err == nil {
                    self.isLoading = false
                    completion(model)
                } else {
                    if let error = err {
                        self.isLoading = true
                        //view.makeToast(error.localizedDescription)
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            self.isLoading = true
            view.makeToast("Internet not connection!!!")
        }
    }
    
    //MARK: get data Moya
    func getMovieTrendingMoya(_ view: UIView,completion: @escaping(([MoviesModel]) -> Void)) {
        if let reachability = Reachability(), reachability .connection != .none {
            self.isLoading = true
            apiProviderMoya.request(.getMovieTrending()) { (result) in
                switch result {
                case .success(_):
                    self.isLoading = false
                    do {
                        let response = try result.get()
                        let value = try response.mapString()
                        if let data = value.data(using: .utf8) {
                            if let json = try? JSON(data: data) {
                                var models: [MoviesModel] = []
                                for item in json["results"].arrayValue {
                                    let dto = RowDTO(item)
                                    let model = RowModel(dto)
                                    let movie = MoviesModel(model)
                                    models.append(movie)
                                    completion(models)
                                }
                            }
                        }
                    } catch {

                    }
                case let .failure(error):
                    self.isLoading = true
                    print(error.localizedDescription)
                }
            }
        } else {
            self.isLoading = true
            view.makeToast("Internet not connection!!!")
        }
    }
    
    
    //MARK: Properties
    func getInfoMovie() {
        
    }
}

//struct Movies: CardSliderItem {
//    var id: Int
//    var image: String
//    var rating: Int?
//    var title: String
//    var subtitle: String?
//    var description: String?
//    
//    init(_ model: RowModel) {
//        self.image = "\(Constants.kUrlImage)\(model.posterPath)"
//        self.rating = Int(model.voteAverage)
//        self.title = model.title
//        self.subtitle = model.overview
//        self.description = nil
//        self.id = model.id
//    }
//}
