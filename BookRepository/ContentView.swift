//
//  ContentView.swift
//  BookRepository
//
//  Created by Aruna Randika on 2023-03-21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var bookRepo = BookRepo()
    
    var body: some View {
        TabView {
            DiscoverView()
                .tabItem {
                    Label("", systemImage: "globe.americas")
                }
            MyBooksView(bookRepo: bookRepo)
                .tabItem {
                    Label("", systemImage: "heart")
                }
            ToReadView()
                .tabItem {
                    Label("", systemImage: "book")
                }
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

