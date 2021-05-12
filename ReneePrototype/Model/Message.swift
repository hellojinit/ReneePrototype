//
//  Message.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toID: String
    let fromID: String
    let isFromCurrentUser: Bool
    let id: String
    let timeStamp: Timestamp
    
    var chatPartnerID: String { return isFromCurrentUser ? toID : fromID}
    
    init(user: User, dictionary: [String: Any]){
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.toID = dictionary["toID"] as? String ?? ""
        self.fromID = dictionary["fromID"] as? String ?? ""
        self.isFromCurrentUser = fromID == Auth.auth().currentUser?.uid
        self.timeStamp = dictionary["timeStamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}



struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "vtlogo", messageText: "Hey wahts uppp>???", isCurrentUser: false),
    .init(id: 1, imageName: "vtlogo", messageText: "Yo hwats popping?", isCurrentUser: true),
    .init(id: 2, imageName: "vtlogo", messageText: "chil", isCurrentUser: false),
    .init(id: 3, imageName: "vtlogo", messageText: "sdsdfsdfsd ds fsd fsd fsfs fsf sdf skdjfnskdf nskd fnds fnds fn sdfnsdj fsdj fjsdj dfjs dnfs dnfk ndkfnsdk fnsk dfnks dnfks ndkjfndskfnskdjnfkjsdn kjfndk fnsdk fnsdk nskfdn fkd nkf sdnkfnsk fnksdnfk sdnf kjsdn kdsnfksd nkdsn fkdsn fksjfn", isCurrentUser: false),
    .init(id: 4, imageName: "vtlogo", messageText: "sggf", isCurrentUser: true),
    .init(id: 5, imageName: "vtlogo", messageText: "okie a dokie ", isCurrentUser: true),
]
