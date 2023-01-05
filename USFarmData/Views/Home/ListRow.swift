//
//  ListRow.swift
//  USFarmData
//
//  Created by Admin on 1/5/23.
//

import SwiftUI

struct ListRow: View {
    var item: ListModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(Color(hex: "#B8EBBD"))
                    .padding(.leading, 20)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.listname)
                        .font(.system(size: 15))
                    Text(item.criteria)
                        .font(.system(size: 12))
                        .foregroundColor(.black.opacity(0.4))
                        .lineLimit(2)
                }
                .padding([.leading, .trailing], 15)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(hex: "#A2A2A2"))
                    .font(.system(size: 16))
                    .padding(.trailing, 25)
            }
            .frame(height: 80)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(6)
                    .shadow(color: .black.opacity(0.16), radius: 6, x: 0, y: 0)
            )
            .padding([.leading, .trailing], 24)
            
            Spacer()
                .frame(height: 20)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var item = ListModel(
        orderno: "GLS1001",
        orderdate: "12/16/2022 12:00:00 AM",
        listname: "IL 40+ acres",
        listcount: "391",
        criteria: "Producer Farm:  Owner/OperatorProducerType, OperatorProducerType    County:  GALLATIN/Illinois, JOHNSON/Illinois    Exact Acres:  40-9999999999    One per Household    100% Address    Dedupe By Address"
    )
    
    static var previews: some View {
        ListRow(item: item)
    }
}
