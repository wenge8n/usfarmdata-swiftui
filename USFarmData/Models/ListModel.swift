//
//  ListModel.swift
//  USFarmData
//
//  Created by Admin on 12/28/22.
//

import Foundation

struct ListModel: Codable, Identifiable {
    var orderno: String
    var orderdate: String
    var listname: String
    var listcount: String
    var criteria: String
    
    var id: String {
        orderno
    }
}
