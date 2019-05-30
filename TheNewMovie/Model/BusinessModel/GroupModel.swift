//
//  GroupModel.swift
//  Dappmovie
//
//  Created by GEM on 3/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class GroupModel: NSObject {
    var detail: [MovieDetailModel] = []
    var cast: [CastModel] = []
    
    init(_ dto: GroupDTO) {
        for dto in dto.detail {
            detail.append(MovieDetailModel(dto))
        }
        for dto in dto.cast {
            cast.append(CastModel(dto))
        }
    }
}
