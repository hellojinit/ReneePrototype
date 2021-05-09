//
//  MessageView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct MessageView: View {
    let messages: MockMessage
    var body: some View {
        HStack{
            if messages.isCurrentUser {
                Spacer()
                Text(messages.messageText)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            else{
                HStack(alignment: .bottom){
                    Image(messages.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                    Text(messages.messageText)
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


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(messages: MOCK_MESSAGES[0])
    }
}
