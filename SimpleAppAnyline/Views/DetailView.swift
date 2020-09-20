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
            if let url = URL(string: userData.avatar_url) {
                URLImage(url: url)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            } else {
                Image(systemName: "questionmark").resizable()
            }
            Text("Score: \(userData.score)").padding(.top, 20)
            Spacer()
            
            
            
            
            if let url = URL(string: userData.html_url) {
                Link("Send me to this person page", destination: url).padding(.bottom, 50)
            } else {
                Text("This person has no page o.O").padding(.bottom, 50)
            }
        }.navigationTitle(userData.login)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userData: ListComponent.getDefaultListComponent())
    }
}
