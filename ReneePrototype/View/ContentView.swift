//
//  ContentView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
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

                UserProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }

                Text("Data")
                    .tabItem {
                        Image(systemName: "doc.text")
                        Text("Data")
                    }
            }
            .navigationBarTitle("Renee")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
