//
//  UserProfileView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedOption: ProfileFilterOptions = .posts
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeader(viewModel: viewModel, isFollowed: $viewModel.isFollowed)
                    .padding()
                ProfileFilterButtons(selectedFilter: $selectedOption)
            }
        }
    }
}
