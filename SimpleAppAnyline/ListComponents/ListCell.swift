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
                if let url = URL(string: listComponent.avatar_url) {
                    URLImage(url: url)
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipped()
                } else {
                    Image(systemName: "questionmark").resizable()
                }
                
                Text(listComponent.login).bold()
                Spacer()
            }
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(listComponent: ListComponent.getDefaultListComponent())
    }
}
