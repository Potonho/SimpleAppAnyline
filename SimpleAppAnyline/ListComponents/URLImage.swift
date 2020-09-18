//
//  URLImage.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import SwiftUI

struct URLImage: View {
    
    @ObservedObject private var loader: ImageLoader
    
    init(urlString: String) {
        loader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        image
            .clipped()
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .scaledToFit()
            } else {
                Image("placeholder")
                .resizable()
                .scaledToFit()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(urlString: "")
    }
}
