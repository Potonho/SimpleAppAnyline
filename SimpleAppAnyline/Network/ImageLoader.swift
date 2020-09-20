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
    
    private var cacheSubscription: AnyCancellable?
    
    init(url: URL) {
        cacheSubscription = ImageCache
            .image(for: url)
            .replaceError(with: UIImage(named: "placeholder"))
            .receive(on: RunLoop.main, options: .none)
            .assign(to: \.image, on: self)
    }
}
