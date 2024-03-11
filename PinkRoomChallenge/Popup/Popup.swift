//
//  Popup.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct Popup: View {
    @ObservedObject var popupViewModel: PopupViewModel
    var content: AnyView
    var edgeTransition: AnyTransition
    
    init(presentPopup: Binding<Bool>, content: AnyView) {
        self.popupViewModel = PopupViewModel(presentPopup: presentPopup)
        self.content = content
        self.edgeTransition = .move(edge: .bottom)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (popupViewModel.presentPopup.wrappedValue) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        popupViewModel.presentPopup.wrappedValue.toggle()
                    }
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: popupViewModel.presentPopup.wrappedValue)
    }
}
