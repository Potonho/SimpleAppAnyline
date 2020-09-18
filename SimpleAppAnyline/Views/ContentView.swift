//
//  ContentView.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var request = RequestUsers()
    
    @State private var searchName: String = "potonho"
    @State private var showSearchBar = false
    
    var body: some View {
        NavigationView() {
            VStack {
                if showSearchBar {
                    ListSearchBar(text: $searchName, onSearchButtonClicked: requestNewSearch)
                }
                
                List(request.listOfComponents, id: \.id) { listComponent in
                    NavigationLink(destination: DetailView(userData: listComponent)) {
                        ListCell(listComponent: listComponent)
                    }
                }.navigationBarTitle(Text(searchName), displayMode: .inline)
                .navigationBarItems(leading:
                                        Button(action: animateSearchBar, label: {
                                            Text("New Search")
                                        }),
                                    trailing:
                                        Button(action: requestNewSearch, label: {
                                            Text("Refresh")
                                        })
                )
                
                
//                HStack() {
//                    Button(action: sortList) {
//                        Text("SORT")
//                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//                            .foregroundColor(Color.white)
//                            .font(.title)
//                    }
//                    .background(Color.gray)
//                    .frame(height: 44)
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .padding(10)
//                }
            }
        }
    }
    
    func sortList() {
        request.listOfComponents.sort {
            $0.login.lowercased() < $1.login.lowercased()
        }
    }
    
    func requestNewSearch() {
        request.requestPhotosWithTag(with: searchName)
        if showSearchBar {
            animateSearchBar()
        }
    }
    
    func animateSearchBar() {
        withAnimation {
            self.showSearchBar.toggle()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
