//
//  RequestUsers.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import Foundation
import Combine

class RequestUsers: ObservableObject {
    
    @Published var listOfComponents : [ListComponent] = []
    
    private var cancellable: AnyCancellable?
    
    init() {
        requestUsersWithQuery(with: "thomas")
    }
    
    init(tag: String) {
        requestUsersWithQuery(with: tag)
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func requestUsersWithQuery(with query: String) {
        if let url = UrlBuilder().BuildUrlForUserSearchWithQuery(query: query) {
            requestNewListWithCombine(url: url)
        }
    }
    
    fileprivate func requestNewListWithCombine(url : URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { JsonPayload(data: $0.data).items}
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.listOfComponents, on: self)
    }
    
    fileprivate func requestNewList(url : URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let photosData = data {
                    let decodeData = try JSONDecoder().decode(JsonPayload.self, from: photosData)
                    DispatchQueue.main.async {
                        self.listOfComponents = decodeData.items
                    }
                } else {
                    print(error?.localizedDescription ?? "error had an error")
                }
            } catch {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
}
