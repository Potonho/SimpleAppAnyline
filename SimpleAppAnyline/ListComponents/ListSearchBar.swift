//
//  ListSearchBar.swift
//  SimpleAppAnyline
//
//  Created by Renato Neves Ribeiro on 17.09.20.
//

import SwiftUI

struct ListSearchBar: UIViewRepresentable {
       
    @Binding var text: String
    var onSearchButtonClicked: () -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, onSearchButtonClicked: onSearchButtonClicked)
    }

    func makeUIView(context: UIViewRepresentableContext<ListSearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.showsCancelButton = true
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context: UIViewRepresentableContext<ListSearchBar>) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var onSearchButtonClicked: () -> Void
        @Binding var text: String

        init(text: Binding<String>, onSearchButtonClicked: @escaping () -> Void) {
            _text = text
            self.onSearchButtonClicked = onSearchButtonClicked
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            onSearchButtonClicked()
            searchBar.resignFirstResponder()
        }
    }
    
}

