//
//  USFarmDataApp.swift
//  USFarmData
//
//  Created by Admin on 12/30/22.
//

import SwiftUI
import UIKit
import SVProgressHUD

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        SVProgressHUD.setDefaultStyle(.dark)
        return true
    }
}

@main
struct USFarmDataApp: App {
    @StateObject private var userData = UserData()
    @StateObject private var errorData = ErrorData()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
                .environmentObject(errorData)
        }
    }
}
