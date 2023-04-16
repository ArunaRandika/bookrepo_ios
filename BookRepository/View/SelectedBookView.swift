//
//  SelectedBookView.swift
//  BookRepository
//
//  Created by Aruna Randika on 2023-03-21.
//

import SwiftUI

struct SelectedBookView: View {
    //var selectedBook: Book
    var body: some View {
        VStack(){
            ScrollView{
                Text("Everything is Fucked")
                    .font(.title)
                    .bold()
                Text("Mark Manson")
                    .foregroundColor(.gray)
                
                Image("book_3")
                    .resizable()
                    .frame(width: 390,height: 320)
                    .cornerRadius(10)
                    
                Text("We live in an interesting time. Materially, everything is the best it’s ever been—we are freer, healthier and wealthier than any people in human history. Yet, somehow everything seems to be irreparably and horribly f*cked—the planet is warming, governments are failing, economies are collapsing, and everyone is perpetually offended on Twitter. At this moment in history, when we have access to technology, education and communication our ancestors couldn’t even dream of, so many of us come back to an overriding feeling of hopelessness.")
                    .foregroundColor(.gray)
            }
            .padding()
            
                
            
        }
        .padding()
        
        
    }
        

}

struct SelectedBookView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBookView()
    }
}
