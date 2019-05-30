//
//  MemberModel.swift
//  Dappmovie
//
//  Created by GEM on 3/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MemberModel: NSObject {
    var mHash: String
    var id: Int
    var iso6391: String
    var iso31661: String
    var name: String
    var includeAdult: Bool
    var username: String
    
    init(_ dto: MemberDTO) {
        mHash = dto.mHash
        id = dto.id
        iso6391 = dto.iso6391
        iso31661 = dto.iso31661
        name = dto.name
        includeAdult = dto.includeAdult
        username = dto.username
    }
}
