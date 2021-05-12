//
//  RegistrationView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct RegistrationView: View {
    @State var email: String = ""
    @State var password1: String = ""
    @State var password2: String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack{
                Text("Renée")
                    .font(.system(.largeTitle, design: .rounded)).bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.09690142423, green: 0.08666530997, blue: 1, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, UIScreen.main.bounds.height*0.10)
                Text("The Social Revolution")
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.light)
                    .foregroundColor(Color(#colorLiteral(red: 0.03671907634, green: 0.3319587111, blue: 0.9664619565, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, UIScreen.main.bounds.height*0.03)
                
                VStack{
                    LogInTextField(text: $email, placeHolder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                    SecureTextField(text: $password1, placeHolder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                    SecureTextField(text: $password2, placeHolder: Text("Confirm Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                    if password1 != password2 {
                        Text("Passwords don't match. Pls enter again.")
                            .padding()
                    }
                    if password1.count < 6{
                        Text("Password too short. Pls enter again")
                            .padding()
                    }
                }.foregroundColor(.white)
                
                NavigationLink(
                    destination: RegistrationSettingUpProfile(email: $email, password: $password1)
                        .navigationBarBackButtonHidden(true),
                    label: {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(Color.green)
                                .frame(width: UIScreen.main.bounds.width*0.9, height:  UIScreen.main.bounds.height*0.05)
                                .background(Color.white)
                                .clipShape(Capsule())
                })
                
                Spacer()
                Button(action: {mode.wrappedValue.dismiss()}, label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 16))
                        Text("Sign In!")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, UIScreen.main.bounds.height*0.05)
                })
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01731243357, green: 0.8090426326, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.6903060079, blue: 0.5570551753, alpha: 1)), Color.init(.systemBlue)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
