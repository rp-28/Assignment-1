//
//  CountryModel.swift
//  Assignment1
//
//  Created by Reshma Pai on 27/05/23.
//

import Foundation

struct DataResponseModel: Codable {
    let title: String?
    let rows: [RowItem]?
}

struct RowItem: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}
