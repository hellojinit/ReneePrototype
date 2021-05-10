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
    
    func loadImage(){
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack(alignment: .top){
                    Image("vtlogo")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    TextArea("Whats popppoingg", text: $captionText)
                    
                    Spacer()
                    
                    Button(action: { showImagePicker.toggle() }, label: {
                        Text("Press this to pick an image")
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .padding()
                    })
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedUIImage)
                    })
                    
                    
                    
                }.padding()
                .navigationBarItems(leading: Button(action: {
                    isShowingNewPostView.toggle()
                }, label: {
                    Text("Cancel")
                }), trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                }))
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .frame(width: 64, height: 64)
                }
                else{
                    Image("vtlogo")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .frame(width: 64, height: 64)
                }
                Spacer()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(isShowingNewPostView: .constant(false), captionText: "")
    }
}
