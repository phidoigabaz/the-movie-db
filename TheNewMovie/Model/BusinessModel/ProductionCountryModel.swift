//
//  ProductionCountryModel.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductionCountryModel: NSObject {
    var iso3166_1: String
    var name: String
    
    init(_ dto: ProductionCountryDTO) {
        iso3166_1 = dto.iso3166_1
        name = dto.name
    }
}
