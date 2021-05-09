//
//  PostCell.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/8/21.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Text("Username")
                    .font(.system(size: 20))
                    .padding(.top, 7)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.top, 10)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                })
            }.foregroundColor(.black)
            
            Image("vtlogo")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 22, height: 22)
                        .padding(5)
                })
                Text("25")
                    .font(.system(size: 22))
                    .fontWeight(.light)
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "message")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 22, height: 22)
                        .padding(5)
                })
                Text("5")
                    .font(.system(size: 22))
                    .fontWeight(.light)
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "checkmark.shield")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 22, height: 22)
                        .padding(5)
                })
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 22, height: 22)
                        .padding(5)
                })
            }
            .padding(.horizontal)
            .accentColor(.black)
            .foregroundColor(.gray)
            .padding(.bottom, 5)
            
            HStack {
                Text("This is some random caption blah blah.dsf sdfsd fasdfnsdnfls dfnla ksdnflsad nflsadn")
                    .frame(width: UIScreen.main.bounds.width - 10, alignment: .topLeading)
                    .padding(.bottom, 20)
            }
        }
        .padding(.zero)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
