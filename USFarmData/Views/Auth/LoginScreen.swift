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
    @State private var showPassword: Bool = false
    
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
            ZStack(alignment: .trailing) {
                Group {
                    if !showPassword {
                        SecureField("Password", text: $password)
                    } else {
                        TextField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 17))
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: !self.showPassword ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
            }
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
