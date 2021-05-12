//
//  ChatView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct ChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User){
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    var body: some View {
        VStack{
            ScrollView{
                VStack (alignment: .leading, spacing: 8){
                    ForEach(viewModel.messages) { messages in
                        MessageView(messages: messages)
                    }
                }
            }
            .padding(.top)
            
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
        }.navigationTitle(user.username)
    }
    
    func sendMessage() {
        viewModel.sendMessages(messageText)
        messageText = ""
    }
}

