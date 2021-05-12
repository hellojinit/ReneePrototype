//
//  MessageInputView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    var action: () -> Void
    var body: some View {
        HStack{
            TextField("message", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action, label: {
                Text("Send")
            })
        }
    }
}
