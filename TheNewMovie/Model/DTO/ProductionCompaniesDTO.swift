//
//  ProductionCompaniesDTO.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductionCompaniesDTO: NSObject {
    var id: Int
    var logoPath: String
    var name: String
    var originCountry: String
    
    init(_ json: JSON) {
        id = json["id"].intValue
        logoPath = json["logo_path"].stringValue
        name = json["name"].stringValue
        originCountry = json["origin_country"].stringValue
    }
}
