//
//  SearchUserCell.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct SearchUserCell: View {
    let user: User
    
    var body: some View {
        HStack (spacing: 12){
            Image("meAndKhushi")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.fullname)
                    .font(.system(size: 14, weight: .semibold))
                Text(user.username)
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
            Spacer()
        }
    }
}
