//
//  FeedView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/8/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewPostView: Bool = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                VStack{
                    ForEach(viewModel.posts){ post in
                        PostCell(post: post)
                    }
                }.padding()
            }
            
            Button(action: {
                isShowingNewPostView.toggle()
                
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewPostView) {
                NewPostView(isPresented: $isShowingNewPostView)
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
