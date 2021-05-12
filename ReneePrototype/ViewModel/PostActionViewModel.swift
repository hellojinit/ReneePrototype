//
//  PostActionViewModel.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import SwiftUI
import Firebase

class PostActionViewModel: ObservableObject {
    let post: Post
    @Published var didLikePost = false
    
    init(post: Post){
        self.post = post
        checkIfUserLikedPost()
    }
    
    func likePost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        Firestore.firestore().collection("posts").document(post.id).updateData(["likes": post.likes + 1]) { _ in
            Firestore.firestore().collection("posts").document(self.post.id).collection("post-likes").document(uid).setData([:]){ _ in
                Firestore.firestore().collection("users").document(uid).collection("user-likes").document(self.post.id).setData([:]){ _ in
                    self.didLikePost = true
                }
            }
        }
    }
    
    func unlikePost(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        Firestore.firestore().collection("posts").document(post.id).updateData(["likes": post.likes - 1]) { _ in
            Firestore.firestore().collection("posts").document(self.post.id).collection("post-likes").document(uid).delete{ _ in
                Firestore.firestore().collection("users").document(uid).collection("user-likes").document(self.post.id).delete{ _ in
                    self.didLikePost = false
                }
            }
        }
    }
    
    func checkIfUserLikedPost(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).collection("user-likes").document(post.id).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLikePost = didLike
        }
    }
}
