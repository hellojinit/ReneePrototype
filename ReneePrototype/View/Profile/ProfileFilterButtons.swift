//
//  ProfileFilterButtons.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/9/21.
//

import SwiftUI

enum ProfileFilterOptions: Int, CaseIterable{
    case posts
    case ideas
    case taggedPosts
    
    var title: String{
        switch self{
        case .posts: return "Posts"
        case .ideas: return "Ideas"
        case .taggedPosts: return "Tagged"
        }
    }
}

struct ProfileFilterButtons: View {
    @Binding var selectedFilter: ProfileFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(ProfileFilterOptions.allCases.count)
    private var padding: CGFloat{
        let rawValue = CGFloat(selectedFilter.rawValue)
        let count = CGFloat(ProfileFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ForEach(ProfileFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedFilter = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth - 8, height: 3)
                    })
                }
            }.padding(.bottom, 10)
            
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .animation(.spring())
                .padding(.leading, padding)
        }
    }
}

struct ProfileFilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFilterButtons(selectedFilter: .constant(.ideas))
    }
}
