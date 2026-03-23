//
//  ContentView.swift
//  FocusFuelPlay
//
//  Created by Daniel Pressner on 18.03.2026.
//

import SwiftUI
import FamilyControls

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(AuthorizationModel.self) private var authorizationModel
    
    var body: some View {
        Group {
            TabView {
                Tab("", systemImage: "checklist") {
                    TaskListView()
                }
                if authorizationModel.authorizationStatus == .approved {
                    Tab("", systemImage: "lock.badge.clock") {
                        Text("Apps")
                    }
                    Tab("", systemImage: "basket") {
                        Text("Store")
                    }
                }
                else {
                    Tab("", systemImage: "lock.badge.clock") {
                        VStack {
                            Image(systemName: "lock.shield")
                                .font(.system(size: 60.0))
                            Text("App locking functionality requires authorization to use Family Controls")
                            Button(action: {}) { Text("Authorize") }
                        }
                    }
                    Tab("", systemImage: "basket") {
                        VStack {
                            Image(systemName: "lock.shield")
                                .font(.system(size: 60.0))
                            Text("Fuel store functionality requires authorization to use Family Controls")
                        }
                    }
                }
            }
            .task {
                        if authorizationModel.authorizationStatus != .approved {
                            await authorizationModel.requestAuthorization()
                        }
                    }
            
        }
    }
}

#Preview {
    ContentView()
}
