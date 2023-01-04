//
//  LoginResponse.swift
//  USFarmData
//
//  Created by Admin on 12/28/22.
//

import Foundation

struct LoginResponse: Codable {
    var token: String
    var errstr: String
}
