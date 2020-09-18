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
        ListCell(listComponent: ListComponent.getDefaultListComponent())
    }
}
