//
//  KindDTO.swift
//  Dappmovie
//
//  Created by admin on 2/22/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class KindDTO: NSObject {
    var id: Int
    var name: String
    
    init(_ json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
    }
}
