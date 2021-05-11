//
//  DataView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct DataView: View {
    @State private var revenueSelection = 0
    @State private var useMyDataOption: Bool = true
    @State private var useAlgorithmOption: Bool = true
    @EnvironmentObject var viewModel: AuthViewModel
    
    let profitShare = 4.20
    
    var body: some View {
            Form{
                Section(header: Text("Settings")){
                    Toggle("Use my data to show me ads", isOn: $useMyDataOption)
                    if useMyDataOption {
                        Text("You can find all your collected data in the \"Your Data\" section.")
                            .foregroundColor(.gray)
                    }
                    else{
                        Text("Your data recording has been paused. We will filter your profit share accordingly.")
                            .foregroundColor(.gray)
                    }
                    Toggle("Use AI algorithm to filter my feed", isOn: $useAlgorithmOption)
                    if !useAlgorithmOption {
                        Text("Your feed will be organized chronologically!")
                            .foregroundColor(.gray)
                    }
                    
                    HStack{
                        Text("Your profit share ")
                        Spacer()
                        Text("$ \(profitShare, specifier: "%.2f")")
                    }
                    
                    HStack{
                        Picker(selection: $revenueSelection, label: Text("Cash-out settings")){
                            Text("Charity").tag(0)
                            Text("Invest").tag(1)
                            Text("Bank Transfer").tag(2)
                            Text("Bitcoin").tag(3)
                        }.pickerStyle(MenuPickerStyle())
                        Spacer()
                        if revenueSelection == 0 {
                            Text("Charity")
                        } else if revenueSelection == 1{
                            Text("Invest")
                        } else if revenueSelection == 2{
                            Text("Bank Transfer")
                        } else{
                            Text("Bitcoin")
                        }
                    }
    
                    if revenueSelection == 0 {
                        Text("Thank You so much for making world a better place!!")
                            .foregroundColor(.gray)
                    } else if revenueSelection == 1{
                        Text("Investing information is unavailable in beta version.")
                            .foregroundColor(.gray)
                    } else if revenueSelection == 2{
                        Text("Information and links to bank transfer is unavailable in beta version.")
                            .foregroundColor(.gray)
                    } else{
                        Text("Information and links to Bitcoin transfer is unavailable in beta version.")
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("Your Data")){
                    HStack{
                        Text("View all your data")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    HStack{
                        Text("Learn how we user your data")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    
                    Link("Terms of Service", destination: URL(string: "www.renee.app")!)
                }
                
                Section{
                    Link("Contact us", destination: URL(string: "www.youtube.com")!)
                        .foregroundColor(.blue)
                    Link("Delete all my data", destination: URL(string: "www.youtube.com")!)
                    Text("Log out")
                        .onTapGesture {
                            viewModel.signOut()
                        }
                    Link("Deactivate my account", destination: URL(string: "www.youtube.com")!)
                }.foregroundColor(.red)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

            }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
