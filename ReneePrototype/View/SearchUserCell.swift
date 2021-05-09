//
//  SearchUserCell.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct SearchUserCell: View {
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
                    .font(.system(size: 14, weight: .semibold))
                Text("username")
                    .font(.system(size: 14))
            }
        }
    }
}

struct SearchUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserCell()
    }
}
