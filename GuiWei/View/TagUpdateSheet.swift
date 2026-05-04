//
//  TagUpdateSheet.swift
//  GuiWei
//
//  Created by Wttch on 2026/5/1.
//

import SwiftUI
import SwiftData


struct TagUpdateSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name: String = ""
    @State private var color: Color = .black
    @State private var remark: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 4) {
                    LabeledContent(content: {
                        TextField("标签名称", text: $name)
                    }, label: {
                        HStack {
                            Circle()
                                .fill(color)
                                .frame(width: 8, height: 8)
                            Text("名称")
                        }
                    })
                    if name.isEmpty {
                        Text("请输入标签名称")
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                }
                ColorPicker("选择颜色", selection: $color, supportsOpacity: false)
                LabeledContent("备注") {
                    TextField("标签备注", text: $remark)
                }
            }
            .listStyle(.automatic)
            .navigationTitle("新建标签")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // 左上角：取消
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.bar)
                    })
                }
                
                // 右上角：加入（确认）
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        guard !name.isEmpty else {
                            return
                        }
                        let tag = Tag(name: name, color: color.toHex(), remark: remark)
                        modelContext.insert(tag)
                        try? modelContext.save()
                        dismiss()
                    }, label: {
                        Image(systemName: "checkmark")
                    })
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}


/// 包装一个预览视图，直接展示 TagUpdateSheet 的样式和功能
fileprivate struct PreviewWrapper: View {
    @State private var showSheet = true
    var body: some View {
        VStack {
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("按钮")
            })
        }
        .sheet(isPresented: $showSheet, content: {
            TagUpdateSheet()
        })
    }
}

#Preview {
    PreviewWrapper()
}
