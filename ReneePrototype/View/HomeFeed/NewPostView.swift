//
//  NewPostView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct NewPostView: View {
    @Binding var isShowingNewPostView: Bool
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Image("vtlogo")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    Text("Some text")
                        .foregroundColor(.gray)
                    
                    Spacer()
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
                Spacer()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(isShowingNewPostView: .constant(false))
    }
}