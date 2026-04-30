//
//  TagManagementView.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
//


import SwiftUI

struct TagManagementView: View {
    @State private var searchText = ""
    
    // 模拟数据
    let tags = [
        (name: "重要", count: 12, color: Color.red),
        (name: "常用", count: 45, color: Color.blue),
        (name: "易碎", count: 5, color: Color.orange),
        (name: "电子产品", count: 28, color: Color.purple),
        (name: "说明书", count: 8, color: Color.gray)
    ]
    
    var filteredTags: [(name: String, count: Int, color: Color)] {
        if searchText.isEmpty { return tags }
        return tags.filter { $0.name.contains(searchText) }
    }

    var body: some View {
        NavigationStack {
            List {
                // 1. 概览统计卡片
                Section {
                    HStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("\(tags.count)")
                                .font(.system(.title, design: .rounded)).bold()
                            Text("总标签数").font(.caption).foregroundStyle(.secondary)
                        }
                        Divider()
                        VStack(alignment: .leading) {
                            Text("\(tags.map({$0.count}).reduce(0, +))")
                                .font(.system(.title, design: .rounded)).bold()
                            Text("已关联物品").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }

                // 2. 标签列表
                Section("所有标签") {
                    ForEach(filteredTags, id: \.name) { tag in
                        NavigationLink {
                            Text("\(tag.name) 关联的物品列表")
                        } label: {
                            HStack {
                                // 标签颜色指示器
                                Circle()
                                    .fill(tag.color)
                                    .frame(width: 8, height: 8)
                                
                                Text(tag.name)
                                    .font(.body)
                                
                                Spacer()
                                
                                // 计数气泡
                                Text("\(tag.count)")
                                    .font(.caption2.bold())
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color(.systemGray5))
                                    .clipShape(Capsule())
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) { /* 删除逻辑 */ } label: {
                                Label("删除", systemImage: "trash")
                            }
                            Button { /* 修改颜色或更名 */ } label: {
                                Label("编辑", systemImage: "pencil")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle("标签管理")
            .searchable(text: $searchText, prompt: "搜索标签")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {}) {
                        Image(systemName: "square.badge.plus")
                    }
                }
            }
        }
    }
}


#Preview {
    TagManagementView()
}
