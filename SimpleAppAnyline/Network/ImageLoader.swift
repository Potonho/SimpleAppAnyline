//
//  ImageLoader.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import SwiftUI
import Foundation
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private let urlString: String
    private var cancellable: AnyCancellable?
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    deinit {
        cancellable?.cancel()
    }

    func load() {
        if !urlString.isEmpty && (self.image == nil) {
            cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
