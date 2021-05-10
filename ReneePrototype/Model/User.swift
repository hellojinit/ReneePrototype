//
//  User.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import Foundation

struct User: Identifiable{
    let id: String
    let fullname: String
    let username: String
    let email: String
    let betaVersionAccess: Int
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.betaVersionAccess = dictionary["betaVersionAccess"] as? Int ?? 1
    }
}
