//
//  SettingsView.swift
//  kajilis
//
//  Created by Claude on 2025/11/20.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true

    var body: some View {
        NavigationStack {
            Form {
                Section("通知") {
                    Toggle("通知を有効化", isOn: $notificationsEnabled)
                }

                Section("アプリについて") {
                    HStack {
                        Text("バージョン")
                        Spacer()
                        Text("1.0.0")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("設定")
        }
    }
}

#Preview {
    SettingsView()
}
