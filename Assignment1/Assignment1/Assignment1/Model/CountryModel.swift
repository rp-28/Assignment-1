//
//  CountryModel.swift
//  Assignment1
//
//  Created by Punith Shenoy on 27/05/23.
//

import Foundation

struct Country: Codable {
    let title: String
    let rows: [RowItem]?
}

struct RowItem: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}
