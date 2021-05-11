//
//  ReneePrototypeApp.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/8/21.
//

import SwiftUI
import Firebase

@main
struct ReneePrototypeApp: App {
    init() {
        FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
