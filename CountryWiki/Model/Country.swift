//
//  Country.swift
//  CountryWiki
//
//  Created by Mohamed Ahmed on 8/20/19.
//  Copyright © 2019 Ahmed Ramzy. All rights reserved.
//

import Foundation

struct countryResponse: Decodable {
    var IsSuccess: Bool?
    var TotalCount: Int?
    var Response: [countryData]?
}

struct countryData : Decodable {
    var Name: String?
    var NativeName: String?
    var Region: String?
    var CurrencyName: String?
    var FlagPng: String?
}
