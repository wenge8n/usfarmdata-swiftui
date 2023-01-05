//
//  LoginScreen.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import SwiftUI
import Alamofire
import SVProgressHUD

struct LoginScreen: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var errorData: ErrorData
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
        let ipaddr = getIPAddress()
        SVProgressHUD.show()
        let parameters: [String: Any] = [
            "UserName": email,
            "Password": password,
            "Userip": ipaddr
        ]
        AF.request(Constants.API_URL + "/mobapp/api/gettoken", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: [LoginResponse].self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    let token = response[0].token
                    if !token.isEmpty {
                        print(token)
                        AppUtils.saveAccessToken(token)
                        userData.token = token
                    } else {
                        let message = response[0].errstr
                        errorData.message = message
                        errorData.showAlert = true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    errorData.message = error.localizedDescription
                    errorData.showAlert = true
                }
                SVProgressHUD.dismiss()
        }
    }
    
    func getIPAddress() -> String {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }

                guard let interface = ptr?.pointee else { return "" }
                let addrFamily = interface.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                    // wifi = ["en0"]
                    // wired = ["en2", "en3", "en4"]
                    // cellular = ["pdp_ip0","pdp_ip1","pdp_ip2","pdp_ip3"]

                    let name: String = String(cString: (interface.ifa_name))
                    if  name == "en0" || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface.ifa_addr, socklen_t((interface.ifa_addr.pointee.sa_len)), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address ?? ""
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
