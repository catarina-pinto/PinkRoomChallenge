//
//  LoginView.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 11/03/2024.
//

import SwiftUI

struct User: Hashable, Equatable {
    var user: [String]
    init(user: [String]) {
        self.user = user
    }
}

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    init(presentPopup: Binding<Bool>) {
        self.loginViewModel = LoginViewModel(presentPopup: presentPopup)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    Spacer()
                    
                    Image("PinkRoomLoginLogo")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 65)
                    
                    TextField("E-mail", text: $loginViewModel.email, prompt: Text("E-mail")
                        .foregroundColor(.black)
                    )
                    .bold()
                    .padding(15)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray,    lineWidth: 2)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                    
                    HStack {
                        Group {
                            if loginViewModel.showPassword {
                                TextField("Password",
                                          text: $loginViewModel.password,
                                          prompt: Text("Password").foregroundColor(.black))
                                .bold()
                            } else {
                                SecureField("Password",
                                            text: $loginViewModel.password,
                                            prompt: Text("Password").foregroundColor(.black))
                                .bold()
                            }
                        }
                        .padding(15)
                        .overlay(alignment: .trailing) {
                            Button {
                                loginViewModel.showPassword.toggle()
                            } label: {
                                Image(systemName: loginViewModel.showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 20)
                            }}
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 2)
                        }
                    }
                    .padding(.horizontal)
                    
                    Button("Sign In") {
                        loginViewModel.authenticate()
                    }
                    .navigationDestination(isPresented: $loginViewModel.shouldNavigate) { MainView(selectedSideMenuTab: 2)
                    }
                    .disabled(loginViewModel.signInDisabled())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(buttonColor)
                    .bold()
                    .padding(15)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(buttonColor, lineWidth: 2)
                    }
                    .padding(.horizontal, 100)
                    .padding(.top, 125)
                    
                    Spacer()
                }
            }
        }
        .background(Color("PinkRoomGray"))
    }
    
    
    var buttonColor: Color {
        return (loginViewModel.signInDisabled()) ? .gray : Color("PinkRoomPink")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(presentPopup: .constant(true))
    }
}
