//
//  HomeModel.swift
//  PinkRoomChallenge
//
//  Created by Catarina Pinto on 12/03/2024.
//

import Foundation
import Alamofire
import AlamofireNetworkActivityLogger

struct APIResponse: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Items]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Items: Decodable {
    var name: String
    var owner: Owner
    var description: String?
    var stargazersCount: Int
    var language: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case owner
        case description
        case stargazersCount = "stargazers_count"
        case language
    }
}

struct Owner: Codable {
    var avatar_url: String
    
    private enum CodingKeys: String, CodingKey {
        case avatar_url
    }
}

struct Repository: Codable, Hashable {
    var name: String
    var description: String
    var language: String
    var stars: Int
    var ownerPicture: String
}

class HomeModel {
    func load(availableLanguages: [Item], availableTopics: [Item], starsAscending: Bool, completion: @escaping ([Repository]) -> Void) {
        NetworkActivityLogger.shared.startLogging()
        
        let filter = filters(availableLanguages: availableLanguages, availableTopics: availableTopics, starsAscending: starsAscending)
        
        let url = "https://api.github.com/search/repositories?q=" + filter
        let request = AF.request(url)
            .validate()
            .responseDecodable(of: APIResponse.self) { (response) in
                guard let list = response.value  else { return }
                
                completion(self.populateRepositoriesList(list: list))
                
                self.scheduleRepetition(availableLanguages: availableLanguages, availableTopics: availableTopics, starsAscending: starsAscending)
            }
    }
    
    func populateRepositoriesList(list: APIResponse) -> [Repository] {
        var repositories = [Repository]()
        
        list.items.forEach { item in
            repositories.append(Repository(name: item.name, description: item.description ?? "", language: item.language ?? "", stars: item.stargazersCount, ownerPicture: item.owner.avatar_url))
        }
        
        return repositories
    }
    
    func scheduleRepetition(availableLanguages: [Item], availableTopics: [Item], starsAscending: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 50.0) {
            self.load(availableLanguages: availableLanguages, availableTopics: availableTopics, starsAscending: starsAscending) { _ in
            }
        }
    }
    
    func filters(availableLanguages: [Item], availableTopics: [Item], starsAscending: Bool) -> String {
        let topicFilters = availableTopics.filter({$0.isSelected})
        let languageFilters = availableLanguages.filter({$0.isSelected})
        
        return topicsFilter(topicFilters: topicFilters) + languagesFilter(languageFilters: languageFilters) + starsFilter(starsAscending: starsAscending)        
    }
    
    func topicsFilter(topicFilters: [Item]) -> String {
        var filter = ""
        topicFilters.forEach {
            topicFilter in
            if filter == "" {
                filter += topicFilter.name
            } else {
                filter += "+" + topicFilter.name
            }
        }
        
        return filter.isEmpty ? "A" : filter
    }
    
    func languagesFilter(languageFilters: [Item]) -> String {
        var filter = ""
        languageFilters.forEach { languageFilter in
            filter += "+language:" + languageFilter.name
            print(languageFilter.name, filter)
        }
        
        return filter
    }
    
    func starsFilter(starsAscending: Bool) -> String {
        var filter = ""
        if starsAscending {
            filter += "&sort=stars&order=asc"
        } else {
            filter += "&sort=stars&order=desc"
        }
        
        return filter
    }
    
}
