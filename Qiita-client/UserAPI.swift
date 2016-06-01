//
//  UserAPI.swift
//  Qiita-client
//
//  Created by Shuhei Kawaguchi on 2016/02/09.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct UserAPI: QiitaRequest {
    typealias Response = User
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        var path = "/user"
        if let token = QiitaAccessToken {
            path = path + "?token=" + token
        }
        print(path)
        return path
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
        return try? decode(object) // get Response from AnyObject using Himotoki
    }
}