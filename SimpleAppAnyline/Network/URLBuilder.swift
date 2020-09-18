//
//  URLBuilder.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import Foundation

struct UrlBuilder {
    
    let scheme = "https"
    let mainUrl = "api.github.com"
    let usersPath = "/search/users"
    
    func BuildUrlForUserSearchWithQuery(query : String) -> URL? {
    
        var urlComp = URLComponents()
        urlComp.scheme = scheme
        urlComp.host = mainUrl
        urlComp.path = usersPath
        urlComp.queryItems = [URLQueryItem(name: "q", value: query)]
        
        return urlComp.url
    }
    
}
