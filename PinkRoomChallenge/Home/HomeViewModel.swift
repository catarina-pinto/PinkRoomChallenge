//
//  HomeViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var presentSideMenu: Binding<Bool>
    @Published var presentFilters: Binding<Bool>
    @Published var homeModel: HomeModel
    @Published var repositories: Binding<[Repository]>
    @Published var availableLanguages: Binding<[Item]>
    @Published var availableTopics: Binding<[Item]>
    @Published var starsAscending: Binding<Bool>
    @Published var firstCall: Bool
    
    private lazy var loadRepositories: Void = {
        self.homeModel.load(availableLanguages: self.availableLanguages.wrappedValue, availableTopics: self.availableTopics.wrappedValue, starsAscending: self.starsAscending.wrappedValue, firstCall: self.firstCall) { list in
            self.repositories.wrappedValue = list
        }
    }()
    
    init(presentSideMenu: Binding<Bool>, presentFilters: Binding<Bool>, availableLanguages: Binding<[Item]>, availableTopics: Binding<[Item]>, starsAscending: Binding<Bool>, repositories: Binding<[Repository]>) {
        self.presentSideMenu = presentSideMenu
        self.presentFilters = presentFilters
        self.availableLanguages = availableLanguages
        self.availableTopics = availableTopics
        self.starsAscending = starsAscending
        self.homeModel = HomeModel()
        self.repositories = repositories
        self.firstCall = true
    }
    
    func load(firstCall: Bool) {
        self.firstCall = firstCall
        
        DispatchQueue.main.async {
            _ = self.loadRepositories
        }
        
    }
}
