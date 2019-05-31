//
//  MovieDetailViewModel.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/28/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import UIKit
import Reachability
import SwiftyJSON

class MovieDetailViewModel {
    var settingService = SettingService()
    var movieDetailModel: [MovieDetailModel] = []
    var castModel: [CastModel] = []
    
    var updateLoadingStatus: (() -> ())?
    
    var isLoading: Bool = false {
        didSet {
            updateLoadingStatus? ()
        }
    }
    
    class func presentMovieDetailModule(_ movieId: Int, navigation: UIViewController) {
        let detailVC = DetailViewController.init(movieId)
        navigation.present(detailVC, animated: true, completion: nil)
    }
    
    //MARK: Get data
    func getMovieDetail(_ view: UIView,_ id: Int, completion: @escaping(([MovieDetailModel]) -> Void)) {
        if let reachability = Reachability(), reachability.connection != .none {
            weak var wself = self
            self.isLoading = true
            //self.settingService.cancelAllRequests()
            //wself?.movieDetailModel.removeAll()
            self.settingService.getMovieDetail(id: id) { (model, err) in
                if err == nil {
                    wself?.isLoading = false
                    completion(model)
                } else {
                    wself?.isLoading = true
                    if let error = err {
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            self.isLoading = true
            view.makeToast("Internet not correct!!!")
        }
    }
    
    func getMovieDetailCast(_ view: UIView,_ id: Int, completion: @escaping(([CastModel]) -> Void)) {
        if let reachability = Reachability(), reachability.connection != .none {
            weak var wself = self
            self.isLoading = true
            //self.settingService.cancelAllRequests()
            //wself?.castModel.removeAll()
            self.settingService.getMovieDetailCredit(id: id) { (model, err) in
                if err == nil {
                    self.isLoading = false
                    completion(model)
                } else {
                    wself?.isLoading = true
                    if let error = err {
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            self.isLoading = true
            view.makeToast("Internet not correct!!!")
        }
    }
    
    //MARK: get data Moya
    func getMovieDetailMoya(_ view: UIView,_ id: Int, completion: @escaping(([MovieDetailModel]) -> Void)) {
        if let reachability = Reachability(), reachability.connection != .none {
            self.isLoading = true
//            apiProviderMoya.request(.getMovieDetail(id)) { (result) in
//                switch result {
//                case .success(_):
//                    self.isLoading = false
//                    do {
//                        let response = try result.get()
//                        let value = try response.mapString()
//                        if let data = value.data(using: .utf8) {
//                            if let json = try? JSON(data: data) {
//                                var models: [MovieDetailModel] = []
//                                for item in json.arrayValue {
//                                    let dto = MovieDetailDTO(item)
//                                    let model = MovieDetailModel(dto)
//                                    models.append(model)
//                                    completion(models)
//                                }
//                            }
//                        }
//                    } catch let error {
//                        print(error.localizedDescription)
//                    }
//                case let .failure(error):
//                    self.isLoading = true
//                    print(error.localizedDescription)
//                }
//            }
            Network.request(target: .getMovieDetail(id), success: { (result) in
                var models: [MovieDetailModel] = []
                let dto = MovieDetailDTO(result)
                let model = MovieDetailModel(dto)
                models.append(model)
                completion(models)

            }, error: { (err) in
                print(err)
            }) { (moyaError) in
                print(moyaError.localizedDescription)
            }
        } else {
            self.isLoading = true
            view.makeToast("Internet not correct!!!")
        }
    }
    
    func getDetailCastMoya(_ view: UIView,_ id: Int, completion: @escaping(([CastModel]) -> Void)) {
        if let reachability = Reachability(), reachability.connection != .none {
            self.isLoading = true
            apiProviderMoya.request(.getMovieCast(id)) { (result) in
                switch result {
                case .success(_):
                    self.isLoading = false
                    do {
                        let response = try result.get()
                        let value = try response.mapString()
                        if let data = value.data(using: .utf8) {
                            if let json = try? JSON(data: data) {
                                var models: [CastModel] = []
                                for item in json["cast"].arrayValue {
                                    let dto = CastDTO(item)
                                    let model = CastModel(dto)
                                    models.append(model)
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
            view.makeToast("Internet not correct!!!")
        }
    }
    //MARK: Properties
    func setHeightRow(_ index: Int,tableView: UITableView) -> CGFloat {
        if index == 0 {
            return 300
        } else if index == 1 {
            return UITableView.automaticDimension
        } else if index == 2 {
            return 180
        } else {
            return 0
        }
    }
    
    func doReloadCastRow(_ cell: CastTableViewCell, text: String, bool: Bool) {
        cell.isSeeall = bool
        cell.seeAllLabel.text = text
        cell.collectionView.reloadData()
        cell.isStatusSeeall = bool
    }
}
