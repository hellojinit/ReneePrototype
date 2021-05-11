//
//  FeedView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/8/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewPostView: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                VStack{
                    ForEach(0..<10){ _ in
                        PostCell()
                    }
                }.padding()
            }
            
            Button(action: {
                viewModel.signOut()
                    //isShowingNewPostView.toggle()
                
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewPostView) {
                NewPostView(isShowingNewPostView: $isShowingNewPostView, captionText: "")
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
