//
//  ContentView.swift
//  kajilis
//
//  Created by 宮澤孝信 on 2025/11/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ShoppingListView()
                .tabItem {
                    Label("買い物", systemImage: "cart")
                }

            MenuPlanView()
                .tabItem {
                    Label("献立", systemImage: "fork.knife")
                }

            TaskListView()
                .tabItem {
                    Label("タスク", systemImage: "checklist")
                }

            SettingsView()
                .tabItem {
                    Label("設定", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
