//
//  ContentView.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        TabView {
            SpaceHomeView()
                .tabItem {
                    Label("空间", systemImage: "house")
                }
            InboxView()
                .tabItem {
                    Label("收集箱", systemImage: "tray.and.arrow.down")
                }
            ProfileView()
                .tabItem {
                    Label("管家", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    ContentView()
        .accessibilityHidden(true)
}
