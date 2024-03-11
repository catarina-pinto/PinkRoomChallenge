//
//  HomeViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var searchText: String
    @Published var isSearching: Bool
    @Published var presentSideMenu: Binding<Bool>
    
    init(presentSideMenu: Binding<Bool>) {
        self.presentSideMenu = presentSideMenu
        self.searchText = ""
        self.isSearching = false
    }
}
