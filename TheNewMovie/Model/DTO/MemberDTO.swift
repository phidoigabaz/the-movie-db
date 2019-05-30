//
//  MemeberDTO.swift
//  Dappmovie
//
//  Created by GEM on 3/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class MemberDTO: NSObject {
    var mHash: String
    var id: Int
    var iso6391: String
    var iso31661: String
    var name: String
    var includeAdult: Bool
    var username: String
    
    init(_ json: JSON) {
        mHash = json["avatar"]["gravatar"]["hash"].stringValue
        id = json["id"].intValue
        iso31661 = json["iso_639_1"].stringValue
        iso6391 = json["iso_3166_1"].stringValue
        name = json["name"].stringValue
        includeAdult = json["include_adult"].boolValue
        username = json["username"].stringValue
    }
}
