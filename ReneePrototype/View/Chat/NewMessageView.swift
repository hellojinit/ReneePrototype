//
//  NewMessageView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    @Binding var user: User?
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack (alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    HStack { Spacer()}
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                        self.user = user
                    }, label: {
                        HStack{
                            SearchUserCell(user: user)
                            Spacer()
                        }
                        
                    })
                }
            }
            .padding(.leading)
        }
    }
}
