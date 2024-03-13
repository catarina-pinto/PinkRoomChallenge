//
//  LoginViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    @Published var showPassword: Bool
    @Published var shouldNavigate: Bool
    @Published var authorizedUsers: [User]
    @Published var presentPopup: Binding<Bool>
    
    init(presentPopup: Binding<Bool>) {
        self.email = ""
        self.password = ""
        self.showPassword = false
        self.shouldNavigate = false
        self.authorizedUsers = [User(user: ["catarina@email.com", "password"]), User(user: ["user@email.com", "password"])]
        self.presentPopup = presentPopup
    }
    
    func authenticate() {
        let userToAuthenticate = User(user: [self.email, self.password])
        
        let authorized = authorizedUsers.contains { [userToAuthenticate].contains($0) }
        if authorized {
            self.shouldNavigate = true
        }
        else {
            self.presentPopup.wrappedValue.toggle()
        }
    }
    
    func signInDisabled() -> Bool {
        if (self.email.isEmpty || self.password.isEmpty || !checkEmailIsValid()) {
            return true
        }
        return false
    }
    
    func checkEmailIsValid() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.email)
    }
}
