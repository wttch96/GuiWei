//
//  SpaceHomeView.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
//

import SwiftUI

// MARK: - Tab 1: 房间与储藏处
struct SpaceHomeView: View {
    // 假设的数据结构，后续对接 SwiftData
    let rooms = ["客厅", "卧室", "书房"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(rooms, id: \.self) { room in
                    Section(header: Text(room)) {
                        // 储藏处采用横向滚动或网格
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                StorageCell(name: "主储物柜", count: 12, isOpaque: true)
                                StorageCell(name: "开放式书架", count: 45, isOpaque: false)
                            }
                            .padding(.vertical, 8)
                        }
                        .listRowBackground(Color.clear) // 消除 List 默认背景，创造卡片感
                        .listRowInsets(EdgeInsets())
                    }
                }
            }
            .navigationTitle("我的空间")
            .toolbar {
                Button(action: {}) { Image(systemName: "plus.circle.fill") }
            }
        }
    }
}

// 储藏处单元格组件
struct StorageCell: View {
    let name: String
    let count: Int
    let isOpaque: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // UI 小贴士：用图标区分开放/非开放
            Image(systemName: isOpaque ? "archivebox.fill" : "square.grid.3x3")
                .font(.title2)
                .foregroundStyle(isOpaque ? .orange : .blue)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(name).font(.headline).lineLimit(1)
                Text("\(count) 件物品").font(.caption).foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(width: 130, height: 110, alignment: .leading)
        .background(.ultraThinMaterial) // 原生质感：毛玻璃背景
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.quaternary, lineWidth: 0.5))
    }
}

#Preview {
    SpaceHomeView()
}
