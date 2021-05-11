//
//  FeedViewModel.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        Firestore.firestore().collection("posts").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else{ return }
            self.posts = documents.map({ Post(dictionary: $0.data()) })
        }
    }
}
