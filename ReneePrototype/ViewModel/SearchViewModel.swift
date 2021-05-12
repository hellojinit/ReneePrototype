//
//  SearchViewModel.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({ User(dictionary: $0.data()) })
            self.users = users.filter({ !$0.isCurrentUser })
        }
    }
    
    func filteredUsers(_ query: String) -> [User]{
        let lowercasedQuery = query.lowercased()
        return users.filter( { $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
    }
}
