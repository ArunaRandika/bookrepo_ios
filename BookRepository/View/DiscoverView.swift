//
//  DiscoverView.swift
//  BookRepository
//
//  Created by Aruna Randika on 2023-03-21.
//

import SwiftUI

struct DiscoverView: View {
    
    @State var mainSearch: String = ""
    @State private var showingSheet = false
    
    var books: [Book] = DummyBooks().books
    
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView(){
                Spacer()
                Text("For You")
                    .font(.title2)
                    .position(x: 50)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(books, id: \.id) { book in
                            ZStack(alignment: .topLeading){
                                Image(book.image)
                                    .resizable()
                                    .blur(radius: 4)
                                    .frame(width: 330,height: 320)
                                    .cornerRadius(20)
                                    
                                Color.white.opacity(0.5)
                                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                    .padding(5)
                                
                                VStack(alignment: .leading){
                                    Text(book.name)
                                        .foregroundColor(.black)
                                        .font(.custom("title3", fixedSize: 23))
                                    Text("by \(String(book.author.prefix(30)))")
                                        .foregroundColor(.black)
                                        .font(.footnote)
                                }
                                .padding()
                            }
                            .onTapGesture {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                               SelectedBookView()
                            }
                            
                        }
                        
                        
                    }
                }
                .padding()
                .frame(height: 300)
                .transition(.move(edge: .bottom))
                
                Spacer()
                
                Text("Popular")
                    .font(.title2)
                    .position(x: 50, y:30)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(books, id: \.id) { book in
                            VStack(alignment: .leading){
                                Image(book.image)
                                    .resizable()
                                    .frame(width: 180,height: 130)
                                    .cornerRadius(10)
                                Text(book.name.prefix(25))
                                    .lineLimit(10)
                                Text("by \(String(book.author.prefix(30)))")
                                    .font(.footnote)
                            }
                            
                        }
                        
                    }
                }
                .padding()
                
                Spacer()
                Text("New Arrivals")
                    .font(.title2)
                    .position(x: 75, y:30)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(books, id: \.id) { book in
                            VStack(alignment: .leading){
                                Image(book.image)
                                    .resizable()
                                    .frame(width: 180,height: 130)
                                    .cornerRadius(10)
                                Text(book.name.prefix(25))
                                    .lineLimit(10)
                                Text("by \(String(book.author.prefix(30)))")
                                    .font(.footnote)
                            }
                            
                        }
                        
                    }
                }
                .padding()
                
                
                
                
            }
            .navigationTitle("Discover")
        }
        
        
        
        
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
