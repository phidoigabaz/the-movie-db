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
    func getMovieTrendingMoya(_ view: UIView,completion: @escaping(([RowModel]) -> Void)) {
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
                                var models: [RowModel] = []
                                for item in json["results"].arrayValue {
                                    let dto = RowDTO(item)
                                    let model = RowModel(dto)
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
            view.makeToast("Internet not connection!!!")
        }
    }
    
    
    //MARK: Properties
    func getInfoMovie() {
        
    }
}
