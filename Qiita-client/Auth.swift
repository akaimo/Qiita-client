//
//  Auth.swift
//  Qiita-client
//
//  Created by Shuhei Kawaguchi on 2016/02/10.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation
import Himotoki

struct Auth: Decodable {
    let url_name: String
    let token: String
    
    static func decode(e: Extractor) throws -> Auth {
        return try Auth(
            url_name: e <| "url_name",
            token: e <| "token"
        )
    }
}
