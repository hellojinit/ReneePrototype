//
//  AuthViewModel.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthentication = false
    @Published var error: Error?
 //  @Published var user: User?
  //  @State private var wrongLoginAlert = false
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
      //    if let error = error {
            //    VStack{
                    
              //  }.alert(isPresented: self.$wrongLoginAlert){
                //    Alert(title: Text("Error loggin in."), message: Text("\(error.localizedDescription)"), primaryButton: .default(Text("Sign up")), secondaryButton: .cancel())
               // }
      //      }
            self.userSession = result?.user
        }
    }
    
    func register(email: String, password: String, username: String, fullname: String, betaVersionAccess: Int, pronouns: String, dob: Date, profileImage: UIImage){
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            storageRef.downloadURL { url, _ in
                guard let profileImageURL = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    guard let user = result?.user else { return }
                    let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "betaVersionAccess": betaVersionAccess, "uid": user.uid, "dob": dob, "pronouns": pronouns, "profileImageURL" : profileImageURL] as [String : Any]
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = user
                    }
                }
            }
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return}
            let user = User(dictionary: data)
            print("\(user.username)")
        }
    }
}
