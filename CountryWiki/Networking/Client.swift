//
//  Client.swift
//  CountryWiki
//
//  Created by Mohamed Ahmed on 8/21/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

import Foundation

struct NetworkClient {
    typealias onSuccess<T> = ((T) -> ())
    typealias onFailure = ( (_ error: Error) -> ())

    static func getCountries(success: @escaping onSuccess<countryResponse>,
                             failure: @escaping onFailure){
        performRequest(router: Router.getCountires, success: { (model) in
            success(model)
        }) { (error) in
            failure(error)
        }
    }

    static func performRequest<T>(router: Router, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T: Decodable {
        let session = URLSession.shared
        session.dataTask(with: router.asURLRequest()) {(data, response, error) in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    success(response)
                } catch{
                    failure(error)
                }
            }
            }.resume()
    }

}
