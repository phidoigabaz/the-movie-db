//
//  SectionModel.swift
//  imuzik
//
//  Created by Huy Nguyen on 3/20/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Foundation
struct SectionModel: PBaseSectionModel {
    var title: String
    var identifier: String?
    typealias Header = PBaseHeaderModel
    var header: Header
    typealias Cell = RowModel
    var rows: [Cell]
    init(title: String, identifier: String? = nil, rows: [RowModel], header: HeaderModel = HeaderModel()) {
        self.title = title
        self.identifier = identifier
        self.rows = rows
        self.header = header
    }
    
    init(title: String, identifier: String? = nil, rows: [RowModel], header: PBaseHeaderModel) {
        self.title = title
        self.identifier = identifier
        self.rows = rows
        self.header = header
    }
}
