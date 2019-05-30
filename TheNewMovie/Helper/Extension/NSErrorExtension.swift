//
//  NSErrorExtension.swift
//  ChenRestaurant
//
//  Created by Tạ Thành Đạt on 5/15/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

extension NSError {
    public static func errorWith(code errorCode: Int, message errorMessage: String) -> NSError {
        return NSError.init(domain: "https://www.themoviedb.org/", code: errorCode,
                            userInfo: [NSLocalizedDescriptionKey: errorMessage])
    }
    
}
