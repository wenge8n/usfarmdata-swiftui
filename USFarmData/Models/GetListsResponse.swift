//
//  GetListsResponse.swift
//  USFarmData
//
//  Created by Admin on 12/28/22.
//

import Foundation

struct GetListsResponse: Codable {
    var lists: [ListModel]
    var errstr: String
}
