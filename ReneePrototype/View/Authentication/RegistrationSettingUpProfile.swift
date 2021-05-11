//
//  RegistrationSettingUpProfile.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import SwiftUI

struct RegistrationSettingUpProfile: View {
    @State var fullname: String = ""
    @State var username: String = ""
    @State var pronouns: String = ""
    @State var dob = Date()
    let betaVersionAccess = 1
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                    LogInTextField(text: $fullname, placeHolder: Text("Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                    LogInTextField(text: $username, placeHolder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                    LogInTextField(text: $pronouns, placeHolder: Text("Pronouns"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                    DatePicker("\(Image(systemName: "calendar"))   Your Birthday",selection: $dob, displayedComponents: .date)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                }.foregroundColor(.white)
                
                Button(action: {
                    viewModel.updateInfo( username: username, fullname: fullname, betaVersionAccess: betaVersionAccess, dob: dob)
                }, label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.green)
                        .frame(width: UIScreen.main.bounds.width*0.9, height:  UIScreen.main.bounds.height*0.05)
                        .background(Color.white)
                        .clipShape(Capsule())
                    
                })
                Text("Disclaimer: All the information entered on this page is stored securely and will NEVER be sold or used for advertising purposes. We care about your privacy more than anything. Click on the \"\(Image(systemName: "info.circle"))\" to know more about each field will be used.")
                    .font(.system(size: 14))
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding()
                
                Spacer()
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01731243357, green: 0.8090426326, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.6903060079, blue: 0.5570551753, alpha: 1)), Color.init(.systemBlue)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .ignoresSafeArea()
    }
}

struct RegistrationSettingUpProfile_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationSettingUpProfile()
    }
}
