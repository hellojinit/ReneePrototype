//
//  RegistrationDataView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/10/21.
//

import SwiftUI

struct RegistrationDataView: View {
    @Binding var email: String
    @Binding var password1: String
    @Binding var fullname: String
    @Binding var username: String
    @Binding var pronouns: String
    @Binding var dob: Date
    @Binding var selectedImage: UIImage?
    let betaVersionAccess = 1
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
                    DatePicker("Your Birthday",selection: $dob, displayedComponents: .date)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                }.foregroundColor(.white)
                
                Button(action: {
                    viewModel.register(email: email, password: password1, username: username, fullname: fullname, betaVersionAccess: betaVersionAccess, pronouns: pronouns, dob: dob, profileImage: selectedImage ?? UIImage(imageLiteralResourceName: "meAndKhushi"))
                }, label: {
                    Text("Set up!")
                        .font(.headline)
                        .foregroundColor(Color.green)
                        .frame(width: UIScreen.main.bounds.width*0.9, height:  UIScreen.main.bounds.height*0.05)
                        .background(Color.white)
                        .clipShape(Capsule())
                    
                })
                Text("This information will be reflected in the \"data\" section and can be updated whenever you want.")
                    .font(.system(size: 14))
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding()
                
                Spacer()
                Button(action: {}, label: {
                    HStack{
                        Text("Set up with Recommended settings")
                            .font(.system(size: 16, weight: .semibold))
                        Image(systemName: "chevron.right")
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

struct RegistrationDataView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationDataView(email: .constant(""), password1: .constant(""), fullname: .constant(""), username: .constant(""), pronouns: .constant(""), dob: .constant(Date()), selectedImage: .constant(UIImage(imageLiteralResourceName: "meAndKhushi")))
    }
}
