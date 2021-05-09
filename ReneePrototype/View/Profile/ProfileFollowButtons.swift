//
//  ProfileFollowButtons.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct ProfileFollowButtons: View {
    
    let isCurrentUser: Bool
    var body: some View {
        if isCurrentUser {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .cornerRadius(40/2)
            .shadow(color: .gray, radius: 8)
        }
        else{
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .frame(width: 160, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
                .cornerRadius(40/2)
                .shadow(color: .gray, radius: 8)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message")
                        .frame(width: 160, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                })
                .cornerRadius(40/2)
                .shadow(color: .gray, radius: 8)
            }
        }
        
    }
}

struct ProfileFollowButtons_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFollowButtons(isCurrentUser: false)
    }
}
