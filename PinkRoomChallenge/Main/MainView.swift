//
//  MainView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel: MainViewModel
    
    init(selectedSideMenuTab: Int) {
        mainViewModel = MainViewModel(selectedSideMenuTab: selectedSideMenuTab)
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $mainViewModel.selectedSideMenuTab) {
                WelcomeView()
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
                LoginView(presentPopup: $mainViewModel.presentPopup)
                    .tag(1)
                    .toolbar(.hidden, for: .tabBar)
                HomeView(presentSideMenu: $mainViewModel.presentSideMenu, presentFilters: $mainViewModel.presentFilters, availableLanguages: $mainViewModel.availableLanguages, availableTopics: $mainViewModel.availableTopics, starsAscending: $mainViewModel.starsAscending, repositories: $mainViewModel.repositories)
                    .tag(2)
                    .toolbar(.hidden, for: .tabBar)
            }
            
            SideMenu(presentSideMenu: $mainViewModel.presentSideMenu, selectedSideMenuTab: $mainViewModel.selectedSideMenuTab, content: AnyView(SideMenuView(presentSideMenu: $mainViewModel.presentSideMenu, selectedSideMenuTab: $mainViewModel.selectedSideMenuTab)))
            
            Popup(presentPopup: $mainViewModel.presentPopup, content: AnyView(PopupView()))
            
            Filters(presentFilters: $mainViewModel.presentFilters, selectedFilter: $mainViewModel.selectedFilter, starsAscending: $mainViewModel.starsAscending, availableLanguages: $mainViewModel.availableLanguages, availableTopics: $mainViewModel.availableTopics, content: AnyView(FiltersView(presentFilters: $mainViewModel.presentFilters, selectedFilter: $mainViewModel.selectedFilter, starsAscending: $mainViewModel.starsAscending, availableLanguages: $mainViewModel.availableLanguages, availableTopics: $mainViewModel.availableTopics)))
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selectedSideMenuTab: 2)
    }
}
