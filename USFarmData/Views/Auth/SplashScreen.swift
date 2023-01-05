//
//  SplashScreen.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var errorData: ErrorData
    @State private var showSplash = true
    
    var body: some View {
        VStack {
            if self.showSplash {
                Image("LogoWithTitle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 128)
            } else {
                NavigationView {
                    if userData.token != nil {
                        HomeScreen()
                    } else {
                        LoginScreen()
                    }
                }
                .alert(errorData.message, isPresented: $errorData.showAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .environmentObject(UserData())
            .environmentObject(ErrorData())
    }
}
