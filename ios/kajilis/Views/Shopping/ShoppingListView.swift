//
//  ShoppingListView.swift
//  kajilis
//
//  Created by Claude on 2025/11/20.
//

import SwiftUI

struct ShoppingListView: View {
    var body: some View {
        NavigationStack {
            List {
                // TODO: 買い物リストアイテムを表示
                Text("買い物リストがまだありません")
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("買い物リスト")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // TODO: アイテム追加処理
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ShoppingListView()
}
