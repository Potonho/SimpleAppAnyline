//
//  URLImage.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import SwiftUI
import Combine

struct URLImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    init(url: URL) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        imageLoader
            .image
            .map { Image(uiImage:$0).resizable() }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: URL(string: "https://avatars2.githubusercontent.com/u/2460641?v=4")!)
    }
}
