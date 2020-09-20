//
//  DetailView.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 18.09.20.
//

import SwiftUI

struct DetailView: View {
    
    var userData : ListComponent
    
    var body: some View {
        VStack{
            URLImage(urlString: userData.avatar_url)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            
            if let url = URL(string: userData.html_url) {
                Link("Send me to this guy page", destination: url)
            } else {
                Text("This guy has no page o.O")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userData: ListComponent.getDefaultListComponent())
    }
}
