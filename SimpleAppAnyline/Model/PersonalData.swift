//
//  PersonalData.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 21.09.20.
//

import Foundation

//https://api.github.com/users/thomasp85

//"name": "Thomas Lin Pedersen",
//  "company": "@rstudio, part of @tidyverse team ",
//  "blog": "www.data-imaginist.com",
//  "location": "Copenhagen",
//  "email": null,
//  "hireable": null,
//  "bio": "Maker of tools focusing on data science and data visualisation",
//  "twitter_username": null,
//  "public_repos": 104,
//  "public_gists": 23,
//  "followers": 2063,
//  "following": 2,
//  "created_at": "2012-05-24T19:00:25Z",
//  "updated_at": "2020-09-07T12:30:52Z"

struct PersonalData: Hashable, Codable {
    var id : Int
    var login: String
    var avatar_url : String
    var score : Int = 0
    var name : String
    var company : String
    var blog : String
    var location : String
    var email : String
    var bio : String
    var followers : String
    var following : String
    
//    static func getDefaultListComponent() -> ListComponent {
//        return PersonalData(id: 1, login: "Potonho", avatar_url: "https://avatars2.githubusercontent.com/u/2460641?v=4", score: 1000, html_url: "https://github.com/potonho")
//    }
}
