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
