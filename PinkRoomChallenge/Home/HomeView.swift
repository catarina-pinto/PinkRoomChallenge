//
//  HomeView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(presentSideMenu: Binding<Bool>, presentFilters: Binding<Bool>, availableLanguages: Binding<[Item]>, availableTopics: Binding<[Item]>, starsAscending: Binding<Bool>, repositories: Binding<[Repository]>) {
        homeViewModel = HomeViewModel(presentSideMenu: presentSideMenu, presentFilters: presentFilters, availableLanguages: availableLanguages, availableTopics: availableTopics, starsAscending: starsAscending, repositories: repositories)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button{
                        homeViewModel.presentSideMenu.wrappedValue.toggle()
                    } label: {
                        Image("SideMenuIcon")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .padding(.leading, 15)
                    }
                    
                    Spacer()
                    
                    Text("CHALLENGE")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 18, design: .rounded))
                    
                    Spacer()
                    
                    Button{
                        homeViewModel.presentFilters.wrappedValue.toggle()
                    } label: {
                        Image("FiltersIcon")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .padding(.trailing, 15)
                    }
                }
                .padding(.top, 15)
                .background(Image("PinkRoomGeneralBackground")
                    .resizable()
                    .frame(width: 435, height: 120, alignment: .center)
                    .clipped()
                    .ignoresSafeArea()
                )
                
                Spacer()
                
                if homeViewModel.repositories.wrappedValue.isEmpty {
                    ProgressView()
                        .controlSize(.large)
                    Spacer()
                } else {
                    RepositoriesListView(items: homeViewModel.repositories.wrappedValue)
                }
            }
            .background(Color("PinkRoomGray"))
            .onAppear {
                homeViewModel.load(firstCall: true)
            }
            .onChange(of: [homeViewModel.availableLanguages.wrappedValue, homeViewModel.availableTopics.wrappedValue]) { _ in
                homeViewModel.load(firstCall: false)
            }
            .onChange(of: homeViewModel.starsAscending.wrappedValue) { _ in
                homeViewModel.load(firstCall: false)
            }
        }
    }
}

struct RepositoriesListView: View {
    var items: [Repository]
    init(items: [Repository]) {
        self.items = items
    }
    
    var body: some View {
        ScrollView {
            ForEach(items, id: \.self) {
                item in
                RepositoryCard(name: item.name, description: item.description, language: item.language, stars: item.stars, owner: item.ownerPicture)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(false), presentFilters: .constant(false), availableLanguages: .constant([Item]()), availableTopics: .constant([Item]()), starsAscending: .constant(false), repositories: .constant([Repository]()))
    }
}
