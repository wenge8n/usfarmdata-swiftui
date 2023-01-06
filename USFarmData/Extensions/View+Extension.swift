//
//  View+Extension.swift
//  USFarmData
//
//  Created by Admin on 1/6/23.
//

import SwiftUI

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
