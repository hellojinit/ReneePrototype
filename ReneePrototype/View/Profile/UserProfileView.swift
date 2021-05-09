//
//  UserProfileView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedOption: ProfileFilterOptions = .posts
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeader()
                    .padding()
                ProfileFilterButtons(selectedFilter: $selectedOption)
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
