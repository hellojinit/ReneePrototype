//
//  MessageView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let messages: Message
    var body: some View {
        HStack{
            if messages.isFromCurrentUser {
                Spacer()
                Text(messages.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            else{
                HStack(alignment: .bottom){
                    KFImage(URL(string: messages.user.profileImageURL))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                    Text(messages.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            
        }
    }
}

