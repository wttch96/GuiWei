//
//  ProfileView.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
//

import SwiftUI


// MARK: - Tab 3: 管理与档案
struct ProfileView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("档案管理") {
                    NavigationLink(destination: Text("分类管理")) {
                        Label("物品大类", systemImage: "square.grid.2x2")
                    }
                    NavigationLink(destination: TagManagementView()) {
                        Label("标签管理", systemImage: "tag")
                    }
                }
                
                Section("统计") {
                    LabeledContent("总物品数", value: "128")
                    LabeledContent("空置储藏位", value: "3")
                }
                
                Section("设置") {
                    Toggle("开启 iCloud 同步", isOn: .constant(true))
                }
            }
            .navigationTitle("我的管家")
        }
    }
}


#Preview {
    ProfileView()
        .accessibilityHidden(true)
}
