//
//  FocusFuelPlayApp.swift
//  FocusFuelPlay
//
//  Created by Daniel Pressner on 18.03.2026.
//

import SwiftUI
import SwiftData

@main
struct FocusFuelPlayApp: App {
    
    @State private var authorizationModel = AuthorizationModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authorizationModel)
        }
        .modelContainer(for: [FuelBalance.self, FuelTask.self])
    }
}
