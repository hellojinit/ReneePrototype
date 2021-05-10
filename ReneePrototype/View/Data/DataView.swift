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
        VStack (spacing: 0){
            Form{
                Section(header: Text("Your Revenue Settings")){
                    Toggle("Use my data to show me ads", isOn: $useMyDataOption)
                    if useMyDataOption {
                        Text("You can find all your collected data in the \"Your Data\" section.")
                            .foregroundColor(.gray)
                    }
                    Toggle("Use AI algorithm to filter my feed", isOn: $useAlgorithmOption)
                    if !useMyDataOption {
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
                        Text("Thank you for making world a better place!!")
                            .foregroundColor(.gray)
                    }else{
                        
                    }
                }
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
