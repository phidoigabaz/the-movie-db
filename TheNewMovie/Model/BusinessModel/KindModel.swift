//
//  KindModel.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class KindModel: NSObject {
    var id: Int
    var name: String
    
    init(_ dto: KindDTO) {
        id = dto.id
        name = dto.name
    }
}
