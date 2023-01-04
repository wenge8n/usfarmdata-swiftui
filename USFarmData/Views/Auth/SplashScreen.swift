//
//  SplashScreen.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        Image("LogoWithTitle")
            .resizable()
            .scaledToFit()
            .frame(width: 240, height: 128)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
