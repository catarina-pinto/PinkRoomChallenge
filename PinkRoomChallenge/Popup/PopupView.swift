//
//  PopupView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        VStack(alignment: .leading) {
            LoginErrorPopupView()
                .frame(width: 380, height: 200, alignment: .bottom)
                .background(
                    Color("PinkRoomGray")
                )
        }
        .background(.clear)
        .cornerRadius(15)
    }
    
    
}

struct LoginErrorPopupView: View{
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            Spacer()
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
            .frame(width: 85)
            
            Text("Invalid credentials")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(15)
    }
}

struct PopupViewView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}

