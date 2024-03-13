//
//  RepositoryViewModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 12/03/2024.
//

import Foundation

class RepositoryViewModel: ObservableObject {
    @Published var name: String
    @Published var description: String
    @Published var language: String
    @Published var stars: Int
    @Published var owner: String
    
    init(name: String, description: String, language: String, stars: Int, owner: String) {
        self.name = name
        self.description = description
        self.language = language
        self.stars = stars
        self.owner = owner
    }
}
