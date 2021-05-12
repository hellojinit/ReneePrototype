//
//  ChatViewModel.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    
    let user: User
    @Published var messages = [Message]()
    
    init(user:User){
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added}) else { return }
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromID = messageData["fromID"] as? String else {return}
                
                COLLECTION_USERS.document(fromID).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                    self.messages.sort(by: { $0.timeStamp.dateValue() < $1.timeStamp.dateValue()})
               
                }
            }
        }
    }
    
    func sendMessages(_ messageText: String){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let currentRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let recievingRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let recievingRecentRef =
            COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        let messageID = currentRef.documentID
        let data: [String: Any] = ["text": messageText,
                                   "id": messageID,
                                   "fromID": currentUid,
                                   "toID": user.id,
                                   "timeStamp": Timestamp(date: Date())]
        currentRef.setData(data)
        recievingRef.document(messageID).setData(data)
        recievingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id).setData(data)
    }
    
}
