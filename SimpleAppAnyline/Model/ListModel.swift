//
//  ListModel.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import Foundation

struct JsonPayload: Codable {
    var total_count : Int = 0
    var incomplete_results : Bool = false
    var items : [ListComponent] = []
    
    init() {
        total_count = 0
        incomplete_results = false
    }
    
    init(data: Data) {
        do {
            self = try JSONDecoder().decode(JsonPayload.self, from: data)
        } catch {
            self = JsonPayload()
        }
    }
}

struct ListComponent: Hashable, Codable {
    var id : Int
    var login: String
    var avatar_url : String
    var score : Int = 0
    var url : String // api
    var html_url : String
    
    static func getDefaultListComponent() -> ListComponent {
        return ListComponent(id: 1, login: "Potonho", avatar_url: "https://avatars2.githubusercontent.com/u/2460641?v=4", score: 1000, url : "https://api.github.com/potonho", html_url: "https://github.com/potonho")
    }
}
