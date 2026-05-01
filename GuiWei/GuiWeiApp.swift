//
//  GuiWeiApp.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
//

import SwiftUI
import SwiftData

@main
struct GuiWeiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Tag.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
