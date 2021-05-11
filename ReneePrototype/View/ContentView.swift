//
//  ContentView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/8/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        ConversationView()
                            .tabItem {
                                Image(systemName: "message")
                                Text("Chat")
                            }
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
/*
                        UserProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Text("Profile")
                           }
*/
                        DataView()
                            .tabItem {
                                Image(systemName: "doc.text")
                                Text("Data")
                            }
                    }
                    .navigationBarTitle("Renee")
                    .navigationBarItems(leading: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "gear")
                            .foregroundColor(.black)
                    }), trailing: Button(action: {}, label: {
                        Image(systemName: "camera")
                            .foregroundColor(.black)
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
