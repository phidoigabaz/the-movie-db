//
//  Constants.swift
//  PamZ
//
//  Created by admin on 10/29/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let isIpad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    static let iPhone = "iPhone"
    static let iPad = "iPad"
    static let iWidth = UIScreen.main.bounds.width
    static let iHeight = UIScreen.main.bounds.height
    static let iIphone5 = UIScreen.main.nativeBounds.width <= 640
    
    static let API_KEY = "f345072be87316265855d0c03be33a8c" //f345072be87316265855d0c03be33a8c
    static let kUrlImage = "https://image.tmdb.org/t/p/w500"
    static let kUrlImageBigSize = "https://image.tmdb.org/t/p/original"
    static let kUrlImageTopSize = ""
    static let kUrlYoutube = "https://www.youtube.com/watch?v="
    
    static let kSeeall = "See all"
    static let kCancel = "Cancel"
    static let kVideonotfound = "The video does not exist"
    static let kWaiting = "Please.Waiting..."
    
    //MARK: User
    static let kUserModel = "USER_MODEL"
    static let loggedIn = "logged_in"
    static let loggedOut = "logged_out"
    static let kLoginStatus = "login_status"
    
    static let kToastDuration: Float  = 2.0
    static let kDefaultLimit: Int = 10
}
