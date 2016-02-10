//
//  LoginAPI.swift
//  Qiita-client
//
//  Created by Shuhei Kawaguchi on 2016/02/10.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct AuthAPI: QiitaRequest {
    typealias Response = Auth
    
    var method: HTTPMethod {
        return.POST
    }
    
    var path: String {
        return "/auth"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
        return try? decode(object)
    }
}
