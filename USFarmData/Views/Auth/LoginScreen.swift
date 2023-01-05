//
//  LoginScreen.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var userData: UserData
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Image("Logo")
                .resizable()
                .aspectRatio(10 / 9, contentMode: .fit)
                .frame(height: 90)
            Text("Sign in to your account")
                .font(.system(size: 22))
            
            TextField("Email", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 17))
                .padding(.top, 25)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 17))
                .padding(.top, 15)
        }
        .padding(16)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
