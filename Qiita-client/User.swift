//
//  User.swift
//  Qiita-client
//
//  Created by Shuhei Kawaguchi on 2016/02/09.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct User: Decodable {
    let id: Int
    let url_name: String
    let profile_image_url: String
    let name: String
    let url: String
    let description: String?
    let organization: String?
    let location: String?
    let facebook: String?
    let linkedin: String?
    let twitter: String?
    let github: String?
    let followers: Int
    let following_users: Int
    let items: Int
    let teams: [UserTeams]?
    let image_upload: [String:Int]
    
    static func decode(e: Extractor) throws -> User {
        return try User(
            id: e <| "id",
            url_name: e <| "url_name",
            profile_image_url: e <| "profile_image_url",
            name: e <| "name",
            url: e <| "url",
            description: e <|? "description",
            organization: e <|? "organization",
            location: e <|? "location",
            facebook: e <|? "facebook",
            linkedin: e <|? "linkedin",
            twitter: e <|? "twitter",
            github: e <|? "github",
            followers: e <| "followers",
            following_users: e <| "following_users",
            items: e <| "items",
            teams: e <||? "teams",
            image_upload: e <|-| "image_upload"
        )
        
    }
    
}