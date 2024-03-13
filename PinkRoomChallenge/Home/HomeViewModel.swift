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
    @Published var presentFilters: Binding<Bool>
    @Published var homeModel: HomeModel
    @Published var repositories: [Repository]
    @Published var availableLanguages: Binding<[Item]>
    @Published var availableTopics: Binding<[Item]>
    @Published var starsAscending: Binding<Bool>
    
    private lazy var loadRepositories: Void = {
        self.homeModel.load(availableLanguages: self.availableLanguages.wrappedValue, availableTopics: self.availableTopics.wrappedValue, starsAscending: self.starsAscending.wrappedValue) { list in
            self.repositories = list
        }
    }()
    
    init(presentSideMenu: Binding<Bool>, presentFilters: Binding<Bool>, availableLanguages: Binding<[Item]>, availableTopics: Binding<[Item]>, starsAscending: Binding<Bool>) {
        self.presentSideMenu = presentSideMenu
        self.searchText = ""
        self.isSearching = false
        self.presentFilters = presentFilters
        self.availableLanguages = availableLanguages
        self.availableTopics = availableTopics
        self.starsAscending = starsAscending
        self.homeModel = HomeModel()
        self.repositories = [Repository]()
        
        if !presentFilters.wrappedValue {
            DispatchQueue.main.async {
                _ = self.loadRepositories
            }
        }
    }
}
