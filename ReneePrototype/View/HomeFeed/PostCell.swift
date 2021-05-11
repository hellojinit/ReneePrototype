//
//  PostCell.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/8/21.
//

import SwiftUI
import Kingfisher

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                KFImage(URL(string: post.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Text("\(post.postUsingUsername ? post.username : post.fullname)")
                    .font(.system(size: 20))
                    .padding(.top, 7)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .padding(.top, 10)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                })
            }.foregroundColor(.black)
            
            KFImage(URL(string: post.imageURL))
                .resizable()
                .clipped()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 22, height: 22)
                        .padding(5)
                })
                Text("\(post.likes.count)")
                    .font(.system(size: 22))
                    .fontWeight(.light)
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "message")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 22, height: 22)
                        .padding(5)
                })
                Text("\(post.comments.count)")
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
            
            HStack {
                Text(post.caption)
                    .frame(width: UIScreen.main.bounds.width - 10, alignment: .topLeading)
                    .padding(.bottom, 20)
            }
        }
        .padding(.zero)
    }
}
