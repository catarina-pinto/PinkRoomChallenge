//
//  HomeView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(presentSideMenu: Binding<Bool>) {
        homeViewModel = HomeViewModel(presentSideMenu: presentSideMenu)
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
                        .padding(.trailing, 40)
                    
                    Spacer()
                }
                .padding(.top, 15)
                .background(Image("PinkRoomGeneralBackground")
                    .resizable()
                    .frame(width: 435, height: 120, alignment: .center)
                    .clipped()
                    .ignoresSafeArea()
                )
           
                Spacer()
                
                
            }
            .background(Color("PinkRoomGray"))
        }
    }
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(false))
    }
}
