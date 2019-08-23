//
//  Router.swift
//  CountryWiki
//
//  Created by Mohamed Ahmed on 8/21/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

import Foundation

enum Router {
    
    case getCountires
    
    var method: String {
        switch self {
        case .getCountires:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .getCountires:
            return "getCountries"
        }
    }
    
    var parameters : [String:Any]? {
        switch self {
        case .getCountires:
            return nil
        }
    }
    
    func asURLRequest() -> URLRequest {
        let url = URL(string: Constants.baseURL + path)
        var request = URLRequest(url: url!)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let parameters = parameters {
            if let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [.prettyPrinted]) {
                request.httpBody = httpBody
            }
        }
        return request
    }
    
}
