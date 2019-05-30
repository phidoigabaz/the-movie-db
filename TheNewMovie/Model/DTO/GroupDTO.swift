//
//  GroupDTO.swift
//  Dappmovie
//
//  Created by taddat on 2/23/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class GroupDTO: NSObject {
    var detail: [MovieDetailDTO] = []
    var cast: [CastDTO] = []
    
    init(_ json: JSON) {
        for (_ , subJson) in json {
            let dto = MovieDetailDTO(subJson)
            detail.append(dto)
        }
        
        for (_ ,subJson) in json["cast"] {
            let dto = CastDTO(subJson)
            cast.append(dto)
        }
    }
}
