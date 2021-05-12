//
//  ConversationView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessage = false
    @State var showChat = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let user = user{
                NavigationLink(
                    destination: LazyView(ChatView(user: user)),
                    isActive: $showChat,
                    label: {})
            }
           
            ScrollView{
                VStack{
                    ForEach(viewModel.recentMessages){ messages in
                        NavigationLink(
                            destination: LazyView(ChatView(user: messages.user)),
                            label: {
                                ConversationCell(message: messages)
                            })
                    }
                }.padding()
            }
            
            Button(action: { self.isShowingNewMessage.toggle() }, label: {
                Image(systemName: "text.bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessage, content: {
                NewMessageView(show: $isShowingNewMessage, startChat: $showChat, user: $user)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
