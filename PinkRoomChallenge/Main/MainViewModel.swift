//
//  MainViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Equatable {
    var id: UUID
    var name: String
    var isSelected: Bool
}

class MainViewModel: ObservableObject {
    @Published var presentSideMenu: Bool
    @Published var selectedSideMenuTab: Int
    @Published var presentPopup: Bool
    @Published var presentFilters: Bool
    @Published var selectedFilter: Int
    @Published var starsAscending: Bool
    @Published var availableLanguages: [Item]
    @Published var availableTopics: [Item]
    @Published var repositories: [Repository]
    
    init(selectedSideMenuTab: Int) {
        self.presentSideMenu = false
        self.selectedSideMenuTab = selectedSideMenuTab
        self.presentPopup = false
        self.presentFilters = false
        self.selectedFilter = -1
        self.starsAscending = false
        self.availableLanguages = [Item(id: UUID(), name: "C++", isSelected: false), Item(id: UUID(), name: "Matlab", isSelected: false), Item(id: UUID(), name: "C#", isSelected: false), Item(id: UUID(), name: "C", isSelected: false), Item(id: UUID(), name: "HTML", isSelected: false), Item(id: UUID(), name: "JavaScript", isSelected: false), Item(id: UUID(), name: "Java", isSelected: false), Item(id: UUID(), name: "Python", isSelected: false), Item(id: UUID(), name: "Ruby", isSelected: false), Item(id: UUID(), name: "Scala", isSelected: false), Item(id: UUID(), name: "Swift", isSelected: false), Item(id: UUID(), name: "PHP", isSelected: false), Item(id: UUID(), name: "CSS", isSelected: false), Item(id: UUID(), name: "R", isSelected: false), Item(id: UUID(), name: "Assembly", isSelected: false), Item(id: UUID(), name: "Go", isSelected: false), Item(id: UUID(), name: "Jupyter", isSelected: false), Item(id: UUID(), name: "TypeScript", isSelected: false), Item(id: UUID(), name: "Shell", isSelected: false)].sorted(by: { language1, language2 in language1.name < language2.name})
        self.availableTopics = [Item(id: UUID(), name: "Tetris", isSelected: false), Item(id: UUID(), name: "Sudoku", isSelected: false), Item(id: UUID(), name: "Spring", isSelected: false), Item(id: UUID(), name: "SpringBoot", isSelected: false)].sorted(by: { topic1, topic2 in topic1.name < topic2.name})
        self.repositories = [Repository]()
    }
}
