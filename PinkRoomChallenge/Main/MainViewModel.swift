//
//  MainViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var presentSideMenu: Bool
    @Published var selectedSideMenuTab: Int
    
    init(selectedSideMenuTab: Int) {
        self.presentSideMenu = false
        self.selectedSideMenuTab = selectedSideMenuTab
    }
}
