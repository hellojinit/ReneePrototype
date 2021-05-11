//
//  User.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import Foundation
import Firebase

struct User: Identifiable {
    let id: String
    let fullname: String
    let username: String
    let email: String
    let profileImageURL: String
    let pronouns: String
    let dob: Date
    let betaVersionAccess: Bool
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id}
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.pronouns = dictionary["pronouns"] as? String ?? ""
        self.dob = dictionary["dob"] as? Date ?? Date()
        self.betaVersionAccess = dictionary["betaVersionAccess"] as? Bool ?? true
    }
}
