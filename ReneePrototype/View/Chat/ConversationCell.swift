//
//  ConversationCell.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack (spacing: 12){
            Image("vtlogo")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4){
                Text("Some User")
                    .font(.system(size: 16, weight: .semibold))
                Text("This is what a very long text will look liek e sf sdf ssadnsandasnd ka da ska dkas dkas dsak dakas kda skd askd aks dkas dkas dkas k")
                    .lineLimit(2)
                    .font(.system(size: 12))
                Divider()
            }
            .padding(.trailing)
            .foregroundColor(.black)
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
