//
//  SearchViewModel.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/29/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import UIKit
import Reachability
import SwiftyJSON

class SearchViewModel {
    var searchModel: [RowModel] = []
    
    var updateLoadingStatus: (() -> ())?
    
    var isLoading: Bool = false {
        didSet {
            updateLoadingStatus? ()
        }
    }
    
    //MARK: present
    class func pushActionSearch(_ viewController: UIViewController) {
        let searchController = SearchViewController.initWithDefaultNib()
        viewController.present(searchController, animated: true, completion: nil)
    }
    
    //MARK: Get data moya
    func searchMovieMoya(_ view: UIView,_ query: String,_ page: Pager,completion: @escaping(([RowModel]) -> Void)) {
        if let reachability = Reachability(), reachability .connection != .none {
            self.isLoading = true
            Network.request(target: .searchMovie(query), success: { (result) in
                self.isLoading = false
                var models: [RowModel] = []
                for subJson in result["results"].arrayValue {
                    let dto = RowDTO(subJson)
                    let model = RowModel(dto)
                    models.append(model)
                }
                completion(models)
                
            }, error: { (err) in
                print(err)
                self.isLoading = true
            }) { (moyaError) in
                self.isLoading = true
                print(moyaError.localizedDescription)
            }
        } else {
            self.isLoading = true
            view.makeToast("Internet not connection!!!")
        }
    }
    
    //MARK: Properties
    func getMovieId(_ index: Int) -> Int {
        return searchModel[index].id
    }
}
