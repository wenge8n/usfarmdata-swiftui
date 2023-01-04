//
//  UserData.swift
//  USFarmData
//
//  Created by Admin on 1/5/23.
//

import Foundation

class UserData: ObservableObject {
    @Published var token = AppUtils.getAccessToken()
}
