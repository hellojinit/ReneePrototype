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
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(
                destination: ChatView(),
                isActive: $showChat,
                label: {})
            
            ScrollView{
                VStack{
                    ForEach(0..<19){ _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
                            })
                    }
                }.padding()
            }
            
            Button(action: { self.isShowingNewMessage.toggle() }, label: {
                Image(systemName: "message.circle")
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
                NewMessageView(show: $isShowingNewMessage, startChat: $showChat)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
