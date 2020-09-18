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
    var id : Int?
    var login: String = ""
    var avatar_url : String = ""
    var score : Int = 0
}
