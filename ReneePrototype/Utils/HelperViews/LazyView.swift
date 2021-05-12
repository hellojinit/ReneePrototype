//
//  LazyView.swift
//  ReneePrototype
//
//  Created by jinit shah on 5/11/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
