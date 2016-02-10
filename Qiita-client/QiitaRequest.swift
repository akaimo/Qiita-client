//
//  QiitaRequest.swift
//  Qiita-client
//
//  Created by Shuhei Kawaguchi on 2016/02/09.
//  Copyright © 2016年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol QiitaRequest: RequestType {
    
}

extension QiitaRequest {
    var baseURL: NSURL {
        return NSURL(string: "https://qiita.com/api/v1")!
    }
}
