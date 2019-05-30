//
//  ProductionCountryDTO.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductionCountryDTO: NSObject {
    var iso3166_1: String
    var name: String
    
    init(_ json: JSON) {
        iso3166_1 = json["iso3166_1"].stringValue
        name = json["name"].stringValue
    }
}
