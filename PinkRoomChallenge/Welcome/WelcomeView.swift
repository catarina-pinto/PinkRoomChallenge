//
//  WelcomeView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var welcomeViewModel: WelcomeViewModel
    
    init() {
        self.welcomeViewModel = WelcomeViewModel()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("PinkRoomWelcomePageBackground")
                    .resizable()
                    .ignoresSafeArea()
            }
            .navigationDestination(
                isPresented: $welcomeViewModel.shouldNavigate) {
                    EmptyView()
                    MainView(selectedSideMenuTab: 1)
                }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(3.0)) {
                welcomeViewModel.shouldNavigate = true
            }
        })
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
