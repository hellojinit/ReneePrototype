//
//  ProfileViewModel.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    let user: User
    @Published var isFollowed = false
    
    init(user: User){
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow(){
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentuid).collection("user-is-following").document(self.user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("followed-by").document(currentuid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow(){
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentuid).collection("user-is-following").document(self.user.id).delete { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("followed-by").document(currentuid).delete { _ in
                self.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollowed(){
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentuid).collection("user-is-following").document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
}
