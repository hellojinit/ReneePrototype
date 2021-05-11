//
//  NewPostView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct NewPostView: View {
    @Binding var isShowingNewPostView: Bool
    @State var captionText: String = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @State var postVisibility: Int = 1
    //0 for close friends, 1 for followers and 2 for public
    @State var postUsingUsername: Bool = true
    @ObservedObject var viewModel: UploadPosts
    
    init(isPresented: Binding<Bool>){
        self._isShowingNewPostView = isPresented
        self.viewModel = UploadPosts(isPresented: isPresented)
    }
    
    func loadImage(){
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    HStack{
                        Text("Caption:")
                            .padding(.leading, 50)
                        TextArea("Start writing here...", text: $captionText)
                    }.padding(.bottom, 100)
                    
                    
                    HStack{
                        Text("Post visibility options go here")
                            .frame(width: UIScreen.main.bounds.width*0.6)
                            .padding()
                        Image(systemName: "chevron.right")
                            .frame(alignment: .leading)
                    }.padding()
                    
                    Toggle.init(isOn: $postUsingUsername, label: {
                        Text("Post using ur username")
                    }).padding()
                    
                    Button(action: { showImagePicker.toggle() }, label: {
                        ZStack {
                            if let image = image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.width*0.8)
                                    .padding()
                            }
                            else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.width*0.8)
                                    .foregroundColor(.blue)
                                    .padding()
                            }
                        }
                    }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedUIImage)
                    })
                    
                }.navigationBarItems(leading: Button(action: {
                    isShowingNewPostView.toggle()
                }, label: {
                    Text("Cancel")
                }), trailing: Button(action: {
                    viewModel.uploadPost(caption: captionText, postVisibility: postVisibility,postUsingUsername: postUsingUsername, imageSelected: selectedUIImage ?? UIImage(imageLiteralResourceName: "meAndKhushi"))
                }, label: {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
            }))
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(isPresented: .constant(true))
    }
}
