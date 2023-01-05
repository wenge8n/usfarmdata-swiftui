//
//  HomeScreen.swift
//  USFarmData
//
//  Created by Admin on 1/4/23.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var errorData: ErrorData
    @State private var listData: [ListModel] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(listData.count) Results")
                    .font(.system(size: 12))
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.top, 12)
                
                List {
                    ForEach(listData) { item in
                        ListRow(item: item)
                    }
                }
                .padding(.top, 25)
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: Button("Logout") {
                UserDefaults.standard.removeObject(forKey: Constants.KEY_ACCESS_TOKEN)
                userData.token = nil
            })
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
