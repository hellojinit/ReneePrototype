//
//  SecureTextField.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct SecureTextField: View {
    @Binding var text: String
    let placeHolder: Text
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeHolder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16){
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width*0.06, height:  UIScreen.main.bounds.height*0.025)
                    .foregroundColor(.white)
                SecureField("", text: $text)
                Spacer()
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width*0.06, height:  UIScreen.main.bounds.height*0.025)
                    .foregroundColor(.white)
            }
        }
    }
}
