//
//  SplashScreen.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showSplash = true
    
    var body: some View {
        VStack {
            if self.showSplash {
                Image("LogoWithTitle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 128)
            } else {
                LoginScreen()
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
    }
}
