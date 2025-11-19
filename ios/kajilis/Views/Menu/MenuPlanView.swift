//
//  MenuPlanView.swift
//  kajilis
//
//  Created by Claude on 2025/11/20.
//

import SwiftUI

struct MenuPlanView: View {
    var body: some View {
        NavigationStack {
            List {
                // TODO: 献立を表示
                Text("献立がまだありません")
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("献立")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // TODO: 献立追加処理
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    MenuPlanView()
}
