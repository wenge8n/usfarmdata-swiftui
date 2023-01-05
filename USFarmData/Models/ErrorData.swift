//
//  ErrorData.swift
//  USFarmData
//
//  Created by Admin on 1/6/23.
//

import Foundation

class ErrorData: ObservableObject {
    @Published var title: String = "Error"
    @Published var message: String = ""
    @Published var showAlert: Bool = false
}
