//
//  RepositoryCard.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 12/03/2024.
//

import SwiftUI

struct RepositoryCard: View {
    @ObservedObject var repositoryViewModel: RepositoryViewModel
    
    init(name: String, description: String, language: String, stars: Int, owner: String) {
        repositoryViewModel = RepositoryViewModel(name: name, description: description, language: language, stars: stars, owner: owner)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray, lineWidth: 2)
                
                VStack(alignment: .leading) {
                    Spacer()
                    !repositoryViewModel.owner.isEmpty ? Spacer() : nil
                    
                    Text(repositoryViewModel.name)
                        .font(.system(size: 18, weight: .bold))
                    
                    Text(repositoryViewModel.description)
                    
                    Spacer()
                    
                    HStack {
                        Text(repositoryViewModel.language)
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("\(repositoryViewModel.stars)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("Owner:")
                                    .foregroundColor(.black)
                                
                                AsyncImage(url: URL(string: repositoryViewModel.owner)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.6)
                                        
                                    } else if phase.error != nil {
                                        
                                        Image(systemName: "xmark.square")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.6)
                                            .foregroundColor(.gray)
                                    } else {
                                        ProgressView()
                                    }
                                }
                                
                                
                                
                            }
                        })
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading, 25)
                .padding(.trailing, 25)
            }
            .frame(width: 350)
            .frame(height: 130)
            
        }
    }
}

struct RepositoryCard_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryCard(name: "Repository number 1", description: "Description of the repository", language: "Swift", stars: 5, owner: "")
    }
}
