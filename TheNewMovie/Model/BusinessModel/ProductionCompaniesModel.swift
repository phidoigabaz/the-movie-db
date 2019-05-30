//
//  ProductionCompaniesModel.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductionCompaniesModel: NSObject {
    var id: Int
    var logoPath: String
    var name: String
    var originCountry: String
    
    init(_ dto: ProductionCompaniesDTO) {
        id = dto.id
        logoPath = dto.logoPath
        name = dto.name
        originCountry = dto.originCountry
    }
}
