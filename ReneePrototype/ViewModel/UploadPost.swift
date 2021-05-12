//
//  UploadPost.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import SwiftUI
import Firebase

class UploadPosts: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>){
        self._isPresented = isPresented
    }
    
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
                let id = NSUUID().uuidString
                
                let data: [String: Any] = ["id": id, "uid": user.id, "username": user.username, "profileImageURL": user.profileImageURL, "fullname": user.fullname ,"caption": caption, "timestamp": Timestamp(date: Date()), "postUsingUsername": postUsingUsername, "postVisibililty": postVisibility, "imageURL": imageURL, "likes": 0, "Comments": 0, "postStorageID": filename]
                
                Firestore.firestore().collection("posts").document(id).setData(data) { _ in
                    self.isPresented = false
                }
            }
        }
    }
}
