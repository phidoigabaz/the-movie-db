//
//  MoviesModel.swift
//  TheNewMovie
//
//  Created by Tạ Thành Đạt on 5/31/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class MoviesModel: CardSliderItem {
    var image: String
    
    var rating: Int?
    
    var title: String
    
    var subtitle: String?
    
    var description: String?
    
    var id: Int
    
    init(_ model: RowModel) {
        self.image = "\(Constants.kUrlImage)\(model.posterPath)"
        self.rating = Int(model.voteAverage)
        self.title = model.title
        self.subtitle = model.overview
        self.description = nil
        self.id = model.id
    }
}
