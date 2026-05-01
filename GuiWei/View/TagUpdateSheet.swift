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
    @State private var color: Color = .cyan
    
    var body: some View {
        NavigationStack {
            Form {
                LabeledContent("名称") {
                    TextField("标签名称", text: $name)
                    
                }
                ColorPicker("标签颜色", selection: $color, supportsOpacity: false)
            }
            .listStyle(.automatic)
            .navigationTitle("加入网络")
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
                    Button("加入") {
//                        connectWiFi()
//                        dismiss()
                    }
                    // .disabled(ssid.isEmpty)
                }
            }
        }
    }
}

fileprivate struct PreviewWrapper: View {
    @State private var showSheet = false
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
