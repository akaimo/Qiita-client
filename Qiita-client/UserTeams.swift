//
//  UserTeams.swift
//  Qiita-client
//
//  Created by Shuhei Kawaguchi on 2016/02/09.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation
import Himotoki

struct UserTeams: Decodable {
    let limit: String
    let used: String
    
    static func decode(e: Extractor) throws -> UserTeams {
        return try UserTeams(
            limit: e <| "limit",
            used: e <| "used"
        )
    }
}