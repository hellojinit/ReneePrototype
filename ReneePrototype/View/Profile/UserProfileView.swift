//
//  UserProfileView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @State var selectedOption: ProfileFilterOptions = .posts
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeader(user: user)
                    .padding()
                ProfileFilterButtons(selectedFilter: $selectedOption)
            }
        }
    }
}
