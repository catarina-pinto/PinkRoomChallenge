//
//  FiltersViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 12/03/2024.
//

import Foundation
import SwiftUI



enum FiltersRowType: Int, CaseIterable{
    case language
    case topic
    case stars
    
    var title: String{
        switch self {
        case .language:
            return "Language"
        case .topic:
            return "Topic"
        case .stars:
            return "Stars"
        }
    }
    
    var iconName: String{
        switch self {
        case .language:
            return "LanguageIcon"
        case .topic:
            return "TopicIcon"
        case .stars:
            return "StarIcon"
        }
    }
}

class FiltersViewModel: ObservableObject {
    @Published var presentFilters: Binding<Bool>
    @Published var starsAscending: Binding<Bool>
    @Published var selectedFilter: Binding<Int>
    @Published var availableLanguages: Binding<[Item]>
    @Published var availableTopics: Binding<[Item]>
    
    init(presentFilters: Binding<Bool>, selectedFilter: Binding<Int>, starsAscending: Binding<Bool>, availableLanguages: Binding<[Item]>, availableTopics: Binding<[Item]>) {
        self.presentFilters = presentFilters
        self.selectedFilter = selectedFilter
        self.starsAscending = starsAscending
        self.availableLanguages = availableLanguages
        self.availableTopics = availableTopics
    }
}
