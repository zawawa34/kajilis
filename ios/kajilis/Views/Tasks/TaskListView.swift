//
//  TaskListView.swift
//  kajilis
//
//  Created by Claude on 2025/11/20.
//

import SwiftUI

struct TaskListView: View {
    var body: some View {
        NavigationStack {
            List {
                // TODO: タスクを表示
                Text("タスクがまだありません")
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("タスク")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // TODO: タスク追加処理
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
