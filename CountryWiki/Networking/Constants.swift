//
//  Constants.swift
//  CountryWiki
//
//  Created by Mohamed Ahmed on 8/21/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

import Foundation

struct Constants {
    static let baseURL = "http://countryapi.gear.host/v1/Country/"
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded; charset=utf-8"
    case accept = "*/*"
    case acceptEncoding = "gzip;q=1.0, compress;q=0.5"
}
