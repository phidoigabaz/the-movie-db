//
//  APIServiceObject.swift
//  HandShake
//
//  Created by hnc on 12/6/17.
//  Copyright © 2017 vietpd-iOS. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
/*
 *  APIServiceObject is a base class, used to manage requests for each service object
 *
 */
class APIServiceObject: NSObject {
    var requests = [DataRequest]()
    var serviceAgent = APIServiceAgent()
    
    static var sharedInstance: APIServiceObject = {
        let instance = APIServiceObject()
        return instance
    }()
    
    /*
     * cancel all request for the certain service object
     * and remove all request from requests
     */
    func cancelAllRequests() {
        let sessionManager = SessionManager.default
        if #available(iOS 9.0, *) {
            sessionManager.session.getAllTasks { (_ tasks: [URLSessionTask]) in
                for task in tasks {
                    task.cancel()
                }
            }
        } else {
            // Fallback on earlier versions
            sessionManager.session.getTasksWithCompletionHandler({ (sessionTasks, uploadTasks, downloadTasks) in
                for task in sessionTasks {
                    task.cancel()
                }
                for task in uploadTasks {
                    task.cancel()
                }
                for task in downloadTasks {
                    task.cancel()
                }
            })
        }
        for request in requests {
            request.cancel()
        }
        requests.removeAll()
    }
    
    /*
     *  add request to request array
     *  @param request  DataRequest
     */
    
    func addToQueue(_ request: DataRequest) {
        requests.append(request)
    }
}
