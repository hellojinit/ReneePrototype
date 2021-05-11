//
//  Post.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import Foundation
import Firebase

struct Post: Identifiable {
    let id: String
    let uid: String
    let profileImageURL: String
    let fullname: String
    let username: String
    let caption: String
    let timeStamp: Timestamp
    let postUsingUsername: Bool
    let postVisibility: Int
    let imageURL: String
    let likes: [String]
    let comments: [String]
    let postStorageID: String
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.postUsingUsername = dictionary["postUsingUsername"] as? Bool ?? true
        self.postVisibility = dictionary["postVisibility"] as? Int ?? 1
        self.imageURL = dictionary["imageURL"] as? String ?? ""
        self.likes = dictionary["likes"] as? [String] ?? []
        self.comments = dictionary["comments"] as? [String] ?? []
        self.postStorageID = dictionary["postStorageID"] as? String ?? ""
        self.timeStamp = dictionary["timeStamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
