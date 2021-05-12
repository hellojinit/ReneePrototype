//
//  PostCellActionView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import SwiftUI

struct PostCellActionView: View {
    let post: Post
    @ObservedObject var viewModel: PostActionViewModel
    
    init(post: Post){
        self.post = post
        self.viewModel = PostActionViewModel(post: post)
    }
    
    var body: some View {
        HStack{
            Button(action: {
                viewModel.didLikePost ? viewModel.unlikePost() : viewModel.likePost()
            }, label: {
                Image(systemName: viewModel.didLikePost ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 22, height: 22)
                    .padding(5)
                    .foregroundColor(viewModel.didLikePost ? .red : .gray)
            })
            Text("\(post.likes)")
                .font(.system(size: 22))
                .fontWeight(.light)
            
            Spacer()
            NavigationLink(destination: PostCommentsView()) {
                Image(systemName: "message")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 22, height: 22)
                    .padding(5)
            }
            Text("\(post.comments)")
                .font(.system(size: 22))
                .fontWeight(.light)
            
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "checkmark.shield")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 22, height: 22)
                    .padding(5)
            })
            
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 22, height: 22)
                    .padding(5)
            })
        }
        .padding(.horizontal)
        .accentColor(.black)
        .foregroundColor(.gray)
        .padding(.bottom, 5)
    }
}
