//
//  TagManagementView.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
//


import SwiftUI
import SwiftData

struct TagManagementView: View {
    @State private var searchText = ""
    @State private var showTagUpdateSheet = false
    
    @Environment(\.modelContext) private var modelContext
    @Query private var tags: [Tag] = []
    
    // 模拟数据
    
    var filteredTags: [Tag] {
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
//                            Text("\(tags.map({$0.count}).reduce(0, +))")
//                                .font(.system(.title, design: .rounded)).bold()
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
                                    .fill(Color.init(hex: tag.color!)!)
                                    .frame(width: 8, height: 8)
                                
                                Text(tag.name)
                                    .font(.body)
                                
                                Text(tag.remark)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                                
                                // 计数气泡
//                                Text("\(tag.count)")
//                                    .font(.caption2.bold())
//                                    .padding(.horizontal, 8)
//                                    .padding(.vertical, 4)
//                                    .background(Color(.systemGray5))
//                                    .clipShape(Capsule())
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                modelContext.delete(tag)
                                try? modelContext.save()
                            } label: {
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
                    Button(action: {
                        showTagUpdateSheet.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }
        .sheet(isPresented: $showTagUpdateSheet, content: {
            TagUpdateSheet()
        })
    }
}


#Preview {
    TagManagementView()
        .modelContainer(
            try! ModelContainer(
                for: Schema([
                    Tag.self
                ]),
                configurations: [
                    ModelConfiguration(isStoredInMemoryOnly: true)
                ]
            )
        )
}
