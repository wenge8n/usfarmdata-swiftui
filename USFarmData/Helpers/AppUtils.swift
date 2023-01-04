//
//  AppUtils.swift
//  USFarmData
//
//  Created by Admin on 12/23/22.
//

import Foundation

class AppUtils {
    static func saveAccessToken(_ token: String) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: Constants.KEY_ACCESS_TOKEN)
    }
    
    static func getAccessToken() -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: Constants.KEY_ACCESS_TOKEN)
    }
    
}
