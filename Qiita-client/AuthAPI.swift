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
    let name: String
    let password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    typealias Response = Auth
    
    var method: HTTPMethod {
        return .POST
    }
    
    var path: String {
        return "/auth"
    }
    
    var parameters: [String: String] {
        return [
            "url_name": name,
            "password": password,
        ]
    }
    
    func configureURLRequest(URLRequest: NSMutableURLRequest) throws -> NSMutableURLRequest {
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        do {
            URLRequest.HTTPBody = try NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions.init(rawValue: 2))
        } catch {
            print("NSJSONSerialization Error")
        }
        return URLRequest
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
        return try? decode(object)
    }
}
