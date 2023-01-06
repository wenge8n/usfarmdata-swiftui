//
//  HomeScreen.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import SwiftUI
import Alamofire
import SVProgressHUD

struct HomeScreen: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var errorData: ErrorData
    @State private var listData: [ListModel] = []
    
    var body: some View {
        VStack {
            Text("\(listData.count) Results")
                .font(.system(size: 12))
                .foregroundColor(.black.opacity(0.4))
                .padding(.top, 12)
            
            List {
                ForEach(listData) { item in
                    ListRow(item: item)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .padding(.top, 25)
        }
        .navigationTitle("Saved Lists")
        .navigationBarItems(trailing: Button("Logout") {
            UserDefaults.standard.removeObject(forKey: Constants.KEY_ACCESS_TOKEN)
            userData.token = nil
        })
        .onViewDidLoad {
            getListId()
        }
    }
    
    func getListId() {
        guard let token = AppUtils.getAccessToken() else { return }
        SVProgressHUD.show()
        AF.request(Constants.API_URL + "/mobapp/api/getlistid?tokenData=" + token)
            .responseDecodable(of: [GetListIdResponse].self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    if !response[0].errstr.isEmpty {
                        errorData.message = response[0].errstr
                        errorData.showAlert = true
                        SVProgressHUD.dismiss()
                    } else {
                        // Get lists
                        self.getLists(listId: response[0].listid)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    errorData.message = error.localizedDescription
                    errorData.showAlert = true
                    SVProgressHUD.dismiss()
                }
        }
    }
    
    func getLists(listId: String) {
        AF.request(Constants.API_URL + "/mobapp/api/getlists?listidData=" + listId)
            .responseDecodable(of: [GetListsResponse].self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    if !response[0].errstr.isEmpty {
                        errorData.message = response[0].errstr
                        errorData.showAlert = true
                    } else {
                        self.listData = response[0].lists
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    errorData.message = error.localizedDescription
                    errorData.showAlert = true
                }
                SVProgressHUD.dismiss()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
