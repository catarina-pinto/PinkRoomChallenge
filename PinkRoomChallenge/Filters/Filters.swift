//
//  Filters.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 12/03/2024.
//

import SwiftUI

struct Filters: View {
    @ObservedObject var filtersViewModel: FiltersViewModel
    var content: AnyView
    var edgeTransition: AnyTransition
    
    init(presentFilters: Binding<Bool>, selectedFilter: Binding<Int>, starsAscending: Binding<Bool>, availableLanguages: Binding<[Item]>, availableTopics: Binding<[Item]>, content: AnyView) {
        self.filtersViewModel = FiltersViewModel(presentFilters: presentFilters, selectedFilter: selectedFilter, starsAscending: starsAscending, availableLanguages: availableLanguages, availableTopics: availableTopics)
        self.content = content
        self.edgeTransition = .move(edge: .trailing)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (filtersViewModel.presentFilters.wrappedValue) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        filtersViewModel.presentFilters.wrappedValue.toggle()
                    }
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
                    .offset(x: 125)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: filtersViewModel.presentFilters.wrappedValue)
        
    }
}
