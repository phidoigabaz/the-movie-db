//
//  CastDTO.swift
//  Dappmovie
//
//  Created by taddat on 2/24/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class CastDTO: NSObject {
    var castId: Int
    var character: String
    var creditId: String
    var gender: Int
    var id: Int
    var name: String
    var order: Int
    var profilePath: String
    
    init(_ json: JSON) {
        castId = json["cast_id"].intValue
        character = json["character"].stringValue
        creditId = json["credit_id"].stringValue
        gender = json["gender"].intValue
        id = json["id"].intValue
        name = json["name"].stringValue
        order = json["order"].intValue
        profilePath = json["profile_path"].stringValue
    }
}

// ->  "cast_id": 4,
//"character": "The Narrator",
//"credit_id": "52fe4250c3a36847f80149f3",
//"gender": 2,
//"id": 819,
//"name": "Edward Norton",
//"order": 0,
//"profile_path": "/eIkFHNlfretLS1spAcIoihKUS62.jpg"
