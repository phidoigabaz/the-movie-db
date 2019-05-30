//
//  Protocols.swift
//  imuzik
//
//  Created by Huy Nguyen on 3/13/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import Foundation

//protocol RowModelConvertible {
//    func rowModel() -> PBaseRowModel
//}

protocol PBaseSectionModel {
    var title: String {set get}
    var identifier: String? {set get}
    associatedtype Cell
    associatedtype Header
    var header: Header {set get}
    var rows: [Cell] {set get}
}

protocol PBaseRowModel {
    var title: String {set get}
    var desc: String {set get}
    var imageUrl: String {set get}
    var identifier: String {set get}
    var objectID: String {set get}
}

protocol PBaseHeaderModel {
    var title: String {set get}
    var identifier: String? {set get}
}
