//
//  ProfileHeader.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        VStack{
            Image("vtlogo")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .shadow(color: .black, radius: 10)
            Text("Some Name")
                .padding(.top, 8)
                .font(.system(size: 16, weight: .semibold))
            Text("@username")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("This is my bio. Kindness is a lfiestyle, not an act")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack{
                VStack{
                    Text("6")
                        .font(.system(size: 16)).bold()
                    Text("Posts")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }.padding(.horizontal, UIScreen.main.bounds.width * 0.03)
                VStack{
                    Text("152")
                        .font(.system(size: 16)).bold()
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }.padding(.horizontal, UIScreen.main.bounds.width * 0.03)

                VStack{
                    Text("133")
                        .font(.system(size: 16)).bold()
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }.padding(.horizontal, UIScreen.main.bounds.width * 0.03)

            }
            .padding()
            
            ProfileFollowButtons(isCurrentUser: false)
                .padding(.top, 20)
            Spacer()
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
