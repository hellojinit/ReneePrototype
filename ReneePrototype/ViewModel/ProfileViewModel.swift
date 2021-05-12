//
//  ProfileViewModel.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User){
        self.user = user
        checkIfUserIsFollowed()
        fetchUserStats()
    }
    
    func follow(){
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentuid).collection("user-is-following").document(self.user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("followed-by").document(currentuid).setData([:]) { _ in
                self.user.isFollowed = true
            }
        }
    }
    
    func unfollow(){
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentuid).collection("user-is-following").document(self.user.id).delete { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("followed-by").document(currentuid).delete { _ in
                self.user.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollowed(){
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        guard !user.isCurrentUser else { return }
        COLLECTION_FOLLOWING.document(currentuid).collection("user-is-following").document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserStats(){
        COLLECTION_FOLLOWERS.document(user.id).collection("user-followers").getDocuments { snapshot, _ in
            guard let followerCount = snapshot?.documents.count else { return }
            COLLECTION_FOLLOWING.document(self.user.id).collection("user-followering").getDocuments { snapshot2, _ in
                guard let followingCount = snapshot2?.documents.count else { return }
                self.user.stats = userStats(followers: followerCount, following: followingCount, publicPost: 0, followerPost: 0, closeFriendsPost: 0)
            }
        }
    }
}
