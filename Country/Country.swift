//
//  Country.swift
//  Country
//
//  Created by Radhe on 08/12/23.
//

import Foundation
struct Country {
    let title: String
    let countryInfos: [CountryInfo]
}

struct CountryInfo {
    let title: String
    let description: String
    let imageURL: URL?
}

