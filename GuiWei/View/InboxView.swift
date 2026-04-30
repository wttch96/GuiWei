//
//  InboxView.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/4/30.
//

import SwiftUI

// MARK: - Tab 2: 收集与分发
struct InboxView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // 顶部的“大动作”区
                    HStack(spacing: 15) {
                        QuickActionCard(title: "快速入库", icon: "plus.viewfinder", color: .green)
                        QuickActionCard(title: "待归位", icon: "shippingbox.and.arrow.backward", color: .orange)
                    }
                    .padding(.horizontal)
                    
                    // 零散物品列表
                    VStack(alignment: .leading) {
                        Text("最近添加").font(.title3.bold()).padding(.horizontal)
                        
                        ForEach(0..<5, id: \.self) { _ in
                            ItemRow(name: "未分类的螺丝刀", desc: "昨天添加")
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("收集箱")
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct ItemRow: View {
    let name: String
    let desc: String
    var categoryIcon: String = "cube.box" // 默认图标
    var tags: [String] = []               // 预留标签展示
    
    var body: some View {
        HStack(spacing: 16) {
            // 1. 物品缩略图占位 (左侧)
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color(.systemGray6))
                    .frame(width: 50, height: 50)
                
                Image(systemName: categoryIcon)
                    .font(.system(size: 20))
                    .foregroundStyle(.secondary)
            }
            
            // 2. 信息区 (中间)
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(desc)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                // 3. 标签流 (如果存在标签)
                if !tags.isEmpty {
                    HStack(spacing: 4) {
                        ForEach(tags, id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 10, weight: .medium))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.accentColor.opacity(0.1))
                                .foregroundStyle(Color.accentColor)
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.top, 2)
                }
            }
            
            Spacer()
            
            // 4. 交互引导 (右侧)
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle()) // 确保整行可点击
    }
}

// 预览预览
#Preview {
    List {
        ItemRow(name: "螺丝刀套装", desc: "精密维修工具，32合1", tags: ["常用", "工具"])
        ItemRow(name: "备用电池", desc: "5号碱性电池 x8", categoryIcon: "battery.100")
    }
}


struct QuickActionCard: View {
    let title: String; let icon: String; let color: Color
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon).font(.largeTitle)
            Text(title).font(.callout).bold()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 25)
        .background(color.opacity(0.1))
        .foregroundStyle(color)
        .cornerRadius(16)
    }
}

#Preview {
    InboxView()
}
