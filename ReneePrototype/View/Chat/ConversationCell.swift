//
//  ConversationCell.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message: Message
    
    var body: some View {
        HStack (spacing: 12){
            KFImage(URL(string: message.user.profileImageURL))
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4){
                Text(message.user.fullname)
                    .font(.system(size: 16, weight: .semibold))
                Text(message.text)
                    .lineLimit(2)
                    .font(.system(size: 12))
                Divider()
            }
            .padding(.trailing)
            .foregroundColor(.black)
        }
    }
}
