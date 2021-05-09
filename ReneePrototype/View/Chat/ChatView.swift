//
//  ChatView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    var body: some View {
        VStack{
            ScrollView{
                VStack (alignment: .leading, spacing: 8){
                    ForEach(MOCK_MESSAGES) { messages in
                        MessageView(messages: messages)
                    }
                }
            }
            .padding(.top)
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

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
