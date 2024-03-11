//
//  PopupView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct PopupView: View {
    @ObservedObject var sideMenuViewModel: SideMenuViewModel
    
    init(presentSideMenu: Binding<Bool>, selectedSideMenuTab: Binding<Int>) {
        self.sideMenuViewModel = SideMenuViewModel(presentSideMenu: presentSideMenu, selectedSideMenuTab: selectedSideMenuTab)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Spacer() 
                LoginErrorPopupView()
                    .frame(height: 140)
                    //.padding(.bottom, 30)
                
                                
               // Spacer()
            }
            //.padding(.top, 100)
            .frame(width: 270)
            .background(
                Color.white
            )
            
           // Spacer()
        }
        .background(.clear)
    }
    
    func LoginErrorPopupView() -> some View{
        VStack(alignment: .center){
            HStack{
                
                ZStack {
                    Circle()
                        .fill(Color("PinkRoomPink"))
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .font(Font.body.weight(.bold))
                        .scaleEffect(0.45)
                        .foregroundColor(Color("PinkRoomGray"))
                }
               // Image(systemName: "xmark")
                 //   .resizable()
                  //  .aspectRatio(contentMode: .fill)
                  //  .frame(width: 100, height: 100)
                   // .cornerRadius(50)
               
            }
            
            //Spacer()
            
            Text("Invalid credentials")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            Text("User is not registered.")
        }
    }
}

struct PopupViewView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(presentSideMenu: .constant(true), selectedSideMenuTab: .constant(0))
    }
}
