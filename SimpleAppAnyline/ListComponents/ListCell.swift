//
//  ListCell.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import SwiftUI

struct ListCell: View {
    
    var listComponent : ListComponent
    
    var body: some View {
        VStack {
            HStack {
                URLImage(urlString: listComponent.avatar_url)
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                Text(listComponent.login).bold()
                Spacer()
            }
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(listComponent: ListComponent(id: 1, login: "Potonho", avatar_url: "https://avatars2.githubusercontent.com/u/2460641?v=4", score: 1000))
    }
}
