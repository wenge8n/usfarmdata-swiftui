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
            
            HStack {
                Spacer()
                NavigationLink {
                    ForgotPasswordScreen()
                } label: {
                    Text("Forgot your password?")
                        .font(.system(size: 12))
                        .foregroundColor(.black.opacity(0.4))
                }
            }
            .padding(.top, 15)
            
            Button {
                loginTapped()
            } label: {
                HStack(spacing: 0) {
                    Spacer()
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.system(size: 15))
                    Text("Sign In")
                        .font(.system(size: 15))
                        .padding(.leading, 20)
                    Spacer()
                }
                .foregroundColor(.white)
                .frame(height: 48)
            }
            .background(Color(hex: "#00600A"))
            .cornerRadius(24)
            .padding(.top, 30)
        }
        .padding(16)
    }
    
    func loginTapped() {
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
