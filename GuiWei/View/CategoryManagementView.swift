//
//  CategoryManagementView.swift
//  GuiWei
//
//  Created by Wttch's Mac mini on 2026/5/24.
//

import SwiftUI
import SwiftData

struct CategoryManagementView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(
        sort: [SortDescriptor(\Category.name)]
    )
    private var categories: [Category]
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    Text(category.name)
                    .swipeActions(content: {
                        Button(role: .destructive) {
                            modelContext.delete(category)
                        } label: {
                            Image(systemName: "trash")
                        }
                    })
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        let newCategory = Category(name: "新分类")
                        modelContext.insert(newCategory)
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    CategoryManagementView()
        .modelContainer(
            try! ModelContainer(
                for: Schema([
                    Category.self
                ]),
                configurations: [
                    ModelConfiguration(isStoredInMemoryOnly: true)
                ]
            )
        )
}
