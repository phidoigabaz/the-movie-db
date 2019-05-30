//
//  CastModel.swift
//  Dappmovie
//
//  Created by taddat on 2/24/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CastModel: NSObject {
    var castId: Int
    var character: String
    var creditId: String
    var gender: Int
    var id: Int
    var name: String
    var order: Int
    var profilePath: String
    
    init(_ dto: CastDTO) {
        castId = dto.castId
        character = dto.character
        creditId = dto.creditId
        gender = dto.gender
        id = dto.id
        name = dto.name
        order = dto.order
        profilePath = dto.profilePath
    }
}
