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
        
    }
    
    init(tag: String) {
        requestPhotosWithTag(with: tag)
    }
    
    func requestPhotosWithTag(with query: String) {
        if let url = UrlBuilder().BuildUrlForUserSearchWithQuery(query: query) {
            requestNewList(url: url)
//            requestNewListWithCombine(url: url)
        }
    }
    
    fileprivate func requestNewList(url : URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let photosData = data {
                    let decodeData = try JSONDecoder().decode(JsonPayload.self, from: photosData)
                    DispatchQueue.main.async {
                        self.listOfComponents = decodeData.items ?? []
                    }
                } else {
                    print(error?.localizedDescription ?? "error had an error")
                }
            } catch {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    // for an example on how to do it without decoder
    fileprivate func requestNewListWithCombine(url : URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { JsonPayload(data: $0.data).items ?? []}
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.listOfComponents, on: self)
    }
}
