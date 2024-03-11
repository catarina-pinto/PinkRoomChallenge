//
//  Popup.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct Popup: View {
    @ObservedObject var sideMenuViewModel: SideMenuViewModel
    var content: AnyView
    var edgeTransition: AnyTransition
    
    init(presentSideMenu: Binding<Bool>, selectedSideMenuTab: Binding<Int>, content: AnyView) {
        self.sideMenuViewModel = SideMenuViewModel(presentSideMenu: presentSideMenu, selectedSideMenuTab: selectedSideMenuTab)
        self.content = content
        self.edgeTransition = .move(edge: .leading)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (sideMenuViewModel.presentSideMenu.wrappedValue) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        sideMenuViewModel.presentSideMenu.wrappedValue.toggle()
                    }
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: sideMenuViewModel.presentSideMenu.wrappedValue)
    }
}
