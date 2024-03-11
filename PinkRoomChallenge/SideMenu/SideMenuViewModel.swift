//
//  SideMenuViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation
import SwiftUI

enum SideMenuRowType: Int, CaseIterable{
    case home = 2
    case logout = 1    
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .logout:
            return "Logout"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "HomeIcon"
        case .logout:
            return "LogoutIcon"
        }
    }
}

class SideMenuViewModel: ObservableObject {
    @Published var presentSideMenu: Binding<Bool>
    @Published var selectedSideMenuTab: Binding<Int>
    
    init(presentSideMenu: Binding<Bool>, selectedSideMenuTab: Binding<Int>) {
        self.presentSideMenu = presentSideMenu
        self.selectedSideMenuTab = selectedSideMenuTab
    }
}
