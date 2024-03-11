//
//  WelcomeViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation

class WelcomeViewModel: ObservableObject {
    @Published var shouldNavigate: Bool
    
    init() {
        self.shouldNavigate = false
    }
}
