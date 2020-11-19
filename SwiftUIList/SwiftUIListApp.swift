//
//  SwiftUIListApp.swift
//  SwiftUIList
//
//  Created by Bill Martensson on 2020-11-19.
//

import SwiftUI
import Firebase

@main
struct SwiftUIListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            FirebaseView()
        }
    }
}
