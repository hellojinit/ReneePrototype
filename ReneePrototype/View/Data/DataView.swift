//
//  DataView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

struct DataView: View {
    @State private var revenueSelection = 1
    @State private var useMyDataOption: Bool = true
    @State private var useAlgorithmOption: Bool = true
    let profitShare = 4.20
    
    var body: some View {
            Form{
                Section(header: Text("Your Revenue Settings")){
                    Toggle("Use my data to show me ads", isOn: $useMyDataOption)
                    if useMyDataOption {
                        Text("You can find all your collected data in the \"Your Data\" section.")
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
                    Picker(selection: $revenueSelection, label: Text("Cash-out settings")){
                        Text("Charity").tag(1)
                        Text("Invest").tag(2)
                        Text("Bank Transfer").tag(3)
                        Text("Bitcoin").tag(4)
                    }.foregroundColor(.black)
                    if revenueSelection == 1 {
                        Text("Thank You so much for making world a better place!!")
                            .foregroundColor(.gray)
                    } else if revenueSelection == 2{
                        Text("Investing information is unavailable in beta version.")
                            .foregroundColor(.gray)
                    } else if revenueSelection == 3{
                        Text("Information and links to bank transfer is unavailable in beta version.")
                            .foregroundColor(.gray)
                    } else{
                        Text("Information and links to Bitcoin transfer is unavailable in beta version.")
                            .foregroundColor(.gray)
                    }
                }
                Section(header: Text("Your Data")){
                    Link("Terms of Service", destination: URL(string: "www.renee.app")!)
                }
            }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
