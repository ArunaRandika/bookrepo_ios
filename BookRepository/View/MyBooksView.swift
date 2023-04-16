//
//  MyBooksView.swift
//  BookRepository
//
//  Created by Aruna Randika on 2023-03-21.
//

import SwiftUI

struct MyBooksView: View {
    
    @ObservedObject var bookRepo: BookRepo
    
    @State private var selectedSection = 0
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    @State private var bookNameInput: String = ""
    @State private var authorName: String = ""
    @State private var description: String = ""
    @State private var imageUrl: String = ""
    
    var body: some View {
        VStack{
            Picker("What is your favorite color?", selection: $selectedSection) {
                Text("Added Books").tag(0)
                Text("Add New").tag(1)
                
            }
            .pickerStyle(.segmented)
            if selectedSection == 1{
                VStack{
                    Button{
                        isShowPhotoLibrary.toggle()
                    }label: {
                        ZStack{
                            AsyncImage(
                                url: URL(string: imageUrl),
                                content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }, placeholder: {
                                    Image("book_placeholder")
                                        .resizable()
                                        .frame(width: 390,height: 320)
                                })
                            .frame(width: 390,height: 320)
                            
                            Spacer()
                            Button {
                                Task{
                                    if (bookNameInput.isEmpty && authorName.isEmpty && imageUrl.isEmpty && description.isEmpty){
                                        print("Empty")
                                    }else{
                                        
                                    }
                                }
                                
                            } label: {
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                                    .opacity(0.8)
                                
                                
                            }
                            
                            
                        }
                    }
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(sourceType: .photoLibrary)
                    }
                    
                    Form{
                        Section{
                            
                            TextField("Book Name", text: $bookNameInput)
                        }header: {
                            Text("Book Name")
                            
                        }
                        Section{
                            
                            TextField("Author", text: $authorName)
                        }header: {
                            Text("Author")
                            
                        }
                        Section{
                            TextEditor(text: $description)
                                
                            .frame(height: 100)                        }header: {
                                Text("Description")
                                
                            }
                        Section{
                            
                            TextField("Image URL", text: $imageUrl)
                        }header: {
                            Text("Image")
                            
                        }
                        
                        
                    }
                    
                    
                    Button{
                        if (bookNameInput.isEmpty && authorName.isEmpty && imageUrl.isEmpty && description.isEmpty){
                            print("Empty")
                        }else{
                            bookRepo.addNewBook(name: bookNameInput, author: authorName, description: description, image: imageUrl)
                        }
                    }label: {
                        Text("Save")
                            .bold()
                        
                    }
                }
            }else{
                List{
                    ForEach(bookRepo.savedBooks) { book in
                        HStack{
                            AsyncImage(
                                url: URL(string: book.image ?? ""),
                                content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }, placeholder: {
                                    Image("book_placeholder")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                })
                            .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading){
                                Text(book.name ?? "")
                                Text(book.author ?? "")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onDelete(perform: bookRepo.deleteBook)                }
                .listStyle(.automatic)
            }
            
            
            
            
        }
        
        
        
        
        
    }
    
}


struct MyBooksView_Previews: PreviewProvider {
    static var previews: some View {
        MyBooksView(bookRepo: BookRepo())
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
}


