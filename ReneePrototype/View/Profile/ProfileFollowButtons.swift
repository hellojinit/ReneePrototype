//
//  ProfileFollowButtons.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct ProfileFollowButtons: View {
    @ObservedObject var viewModel: ProfileViewModel
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .cornerRadius(40/2)
            .shadow(color: .gray, radius: 8)
        }
        else{
            HStack{
                Button(action: {
                    viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(viewModel.user.isFollowed ? "Following" : "Follow")
                        .frame(width: 160, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
                .cornerRadius(40/2)
                .shadow(color: .gray, radius: 8)
                
                NavigationLink(destination: ChatView(user: viewModel.user), label: {
                    Text("Message")
                        .frame(width: 160, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                })
                
                .cornerRadius(40/2)
                .shadow(color: .gray, radius: 8)
            }
        }
        
    }
}
