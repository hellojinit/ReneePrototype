//
//  UploadPost.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import SwiftUI
import Firebase

class UploadPosts: ObservableObject {
    func uploadPost(caption: String, postVisibility: Int, postUsingUsername: Bool, imageSelected: UIImage){
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("posts").child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            storageRef.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else { return }
                guard let user = AuthViewModel.shared.user else { return }
                
                let data: [String: Any] = ["uid": user.id, "username": user.username, "caption": caption, "timestamp": Date(), "postUsingUsername": postUsingUsername, "postVisibililty": postVisibility, "imageURL": imageURL, "likes": [String](), "Comments": [String](), "postStorageID": filename]
                
                Firestore.firestore().collection("posts").document().setData(data) { _ in
                    
                }
            }
        }
    }
}
