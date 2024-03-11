//
//  SideMenuView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct SideMenuView: View {
    @ObservedObject var sideMenuViewModel: SideMenuViewModel
    
    init(presentSideMenu: Binding<Bool>, selectedSideMenuTab: Binding<Int>) {
        self.sideMenuViewModel = SideMenuViewModel(presentSideMenu: presentSideMenu, selectedSideMenuTab: selectedSideMenuTab)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                ProfileImageView()
                    .frame(height: 140)
                    .padding(.bottom, 30)
                
                ForEach(SideMenuRowType.allCases, id: \.self){ row in
                    RowView(isSelected: sideMenuViewModel.selectedSideMenuTab.wrappedValue == row.rawValue, imageName: row.iconName, title: row.title) {
                        sideMenuViewModel.selectedSideMenuTab.wrappedValue = row.rawValue
                        sideMenuViewModel.presentSideMenu.wrappedValue.toggle()
                    }
                }
                
                Spacer()
            }
            .padding(.top, 100)
            .frame(width: 270)
            .background(
                Color.white
            )
            
            Spacer()
        }
        .background(.clear)
    }
    
    func ProfileImageView() -> some View{
        VStack(alignment: .center){
            HStack{
                Spacer()
                Image("PinkRoomProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                Spacer()
            }
            
            Text("Catarina Pinto")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
        }
    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Rectangle()
                        .fill(isSelected ? Color("PinkRoomPink") : .white)
                        .frame(width: 5)
                    
                    ZStack{
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? Color("PinkRoomPink")
                .opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
        )
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(presentSideMenu: .constant(true), selectedSideMenuTab: .constant(0))
    }
}
