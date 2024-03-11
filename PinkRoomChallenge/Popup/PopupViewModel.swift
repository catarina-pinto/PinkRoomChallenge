//
//  PopupViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation
import SwiftUI

class PopupViewModel: ObservableObject {
    @Published var presentPopup: Binding<Bool>
    
    init(presentPopup: Binding<Bool>) {
        self.presentPopup = presentPopup
    }
}
