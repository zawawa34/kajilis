# Design System

## 概要

Kajilisのデザインシステムは、Apple Human Interface Guidelinesに準拠したiOSネイティブ体験を提供します。デザイン経験が少ない開発者でも、AIエージェントと協力して高品質なアプリを効率的に開発できるよう設計されています。

## デザインコンセプト

**「家族が自然に使える、温かみのあるiOSネイティブ体験」**

- **使いやすさ最優先**: iOSユーザーが直感的に操作できる標準UI
- **温かみ**: 暖色系アクセントカラーで家庭的な雰囲気
- **シンプル**: 機能に集中できる無駄のないデザイン
- **効率的開発**: AIエージェントが実装しやすい標準準拠設計

## デザイン方針サマリー

| 項目 | 選択内容 | 理由 |
|------|---------|------|
| **デザインシステム** | Apple Human Interface Guidelines準拠 | iOSユーザーにとって直感的、実装コストが低い |
| **カラーテーマ** | iOS標準カラー + 暖色系アクセントカラー | ライト/ダークモード自動対応、最小限のカスタマイズ |
| **UI実装** | SwiftUI標準コンポーネント中心 | 実装が簡単、AIエージェントに依頼しやすい |
| **アイコン** | SF Symbols完全利用 | アセット管理不要、アクセシビリティ自動対応 |
| **タイポグラフィ** | San Francisco(システムフォント) | ダイナミックタイプ対応、読みやすさ最適化 |

---

## カラーシステム

### 基本カラー(iOS Semantic Colors)

iOSの標準セマンティックカラーを使用し、ライト/ダークモードに自動対応します。

#### テキストカラー

```swift
.primary          // プライマリテキスト、アイコン
.secondary        // セカンダリテキスト、補足情報
.tertiary         // さらに薄いテキスト
.quaternary       // 最も薄いテキスト
```

#### 背景カラー

```swift
.background              // 画面背景
.secondaryBackground     // セクション背景
.tertiaryBackground      // グループ化された背景
.groupedBackground       // グループリスト背景
.secondaryGroupedBackground  // グループ内セクション背景
```

#### システムカラー

```swift
.label           // 標準テキストカラー
.systemGray      // グレー系(1-6の6段階)
.systemRed       // エラー、削除アクション
.systemGreen     // 成功、確認アクション
```

### アクセントカラー(カスタム定義)

アプリの個性を表現する暖色系アクセントカラーを定義します。

#### Primary Accent - AccentOrange

```swift
Color("AccentOrange")

// ライトモード
HEX: #FF9500
RGB: (255, 149, 0)

// ダークモード
HEX: #FF9F0A
RGB: (255, 159, 10)
```

**使用箇所:**
- タブバーの選択状態
- プライマリボタン(「追加」「保存」等)
- チェックマーク・完了状態
- 重要な通知・バッジ
- インタラクティブ要素のハイライト

**代替案:**
- **ピーチオレンジ** (#FF9F70): より柔らかい印象
- **コーラル** (#FF8566): 温かみと落ち着きのバランス

#### カラーアセットの作成手順

1. Xcodeで `ios/kajilis/Assets.xcassets` を開く
2. 左下の `+` ボタン → `New Color Set`
3. 名前を `AccentOrange` に変更
4. Attributesインスペクタで `Appearances` → `Any, Dark` を選択
5. カラー設定:
   - **Any Appearance**: `#FF9500`
   - **Dark Appearance**: `#FF9F0A`

#### アプリ全体への適用

```swift
// KajilisApp.swift
@main
struct KajilisApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(Color("AccentOrange")) // アプリ全体に適用
        }
    }
}
```

---

## タイポグラフィ

### システムフォント - San Francisco

Apple標準のSan Franciscoフォントを使用し、ダイナミックタイプに完全対応します。

#### テキストスタイル

```swift
// 大見出し
.font(.largeTitle)  // 34pt - 画面タイトル、主要な見出し
.font(.title)       // 28pt - セクションタイトル
.font(.title2)      // 22pt - サブセクションタイトル
.font(.title3)      // 20pt - カードタイトル

// 本文
.font(.body)        // 17pt - 標準テキスト(デフォルト)
.font(.callout)     // 16pt - 強調テキスト
.font(.subheadline) // 15pt - サブテキスト
.font(.footnote)    // 13pt - 補足情報
.font(.caption)     // 12pt - キャプション
.font(.caption2)    // 11pt - 最小テキスト
```

#### フォントウェイト

```swift
.fontWeight(.regular)   // 通常テキスト(デフォルト)
.fontWeight(.medium)    // やや強調
.fontWeight(.semibold)  // 見出し、重要な情報
.fontWeight(.bold)      // 重要な見出し、アクション
```

#### 使用例

```swift
// 画面タイトル
Text("買い物リスト")
    .font(.largeTitle)
    .fontWeight(.bold)

// セクションヘッダー
Text("今日のタスク")
    .font(.title2)
    .fontWeight(.semibold)

// 本文テキスト
Text("牛乳を買う")
    .font(.body)

// 補足情報
Text("2リットル")
    .font(.caption)
    .foregroundStyle(.secondary)
```

---

## アイコンシステム - SF Symbols

AppleのSF Symbolsアイコンセットを完全活用します。5,000以上のシンボルが利用可能で、アセット管理が不要です。

### 主要機能別アイコン一覧

#### 買い物リスト関連

```swift
"cart"                  // 買い物カート
"cart.fill"            // 買い物カート(塗りつぶし)
"basket"               // バスケット
"basket.fill"          // バスケット(塗りつぶし)
"bag"                  // ショッピングバッグ
"bag.fill"             // ショッピングバッグ(塗りつぶし)
"checkmark.circle"     // チェック(未完了)
"checkmark.circle.fill" // チェック(完了)
```

#### 献立関連

```swift
"fork.knife"           // 食事
"takeoutbag.and.cup.and.straw"  // テイクアウト
"calendar"             // カレンダー
"book.closed"          // レシピ本(閉じた)
"book"                 // レシピ本(開いた)
"leaf"                 // 野菜・健康
```

#### 家事タスク関連

```swift
"checklist"            // チェックリスト
"list.bullet"          // 箇条書きリスト
"circle"               // 未完了マーク
"circle.fill"          // 完了マーク(グレー)
"checkmark.circle.fill" // 完了マーク(アクセント)
"clock"                // 時間
"clock.fill"           // 時間(塗りつぶし)
```

#### 家族・ユーザー関連

```swift
"person"               // 個人
"person.fill"          // 個人(塗りつぶし)
"person.2"             // 複数人
"person.2.fill"        // 複数人(塗りつぶし)
"house"                // 家
"house.fill"           // 家(塗りつぶし)
```

#### アクション・ナビゲーション

```swift
"plus"                 // 追加
"plus.circle.fill"     // 追加(塗りつぶし)
"trash"                // 削除
"trash.fill"           // 削除(塗りつぶし)
"pencil"               // 編集
"square.and.arrow.up"  // 共有
"ellipsis.circle"      // その他メニュー
"gearshape"            // 設定
"bell"                 // 通知
"bell.fill"            // 通知(塗りつぶし)
```

### 使用例

```swift
// 基本的な使用
Image(systemName: "cart")

// カラー適用
Image(systemName: "checkmark.circle.fill")
    .foregroundStyle(Color("AccentOrange"))

// サイズ調整
Image(systemName: "plus")
    .font(.title2)

// 複数カラー(Hierarchical)
Image(systemName: "person.2.fill")
    .symbolRenderingMode(.hierarchical)
    .foregroundStyle(Color("AccentOrange"))
```

---

## UIコンポーネント

### ナビゲーション

#### NavigationStack

```swift
NavigationStack {
    List {
        // コンテンツ
    }
    .navigationTitle("買い物リスト")
    .navigationBarTitleDisplayMode(.large) // または .inline
    .toolbar {
        ToolbarItem(placement: .primaryAction) {
            Button {
                // アクション
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}
```

#### TabView

```swift
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
.tint(Color("AccentOrange"))
```

### リスト

#### 標準List

```swift
List {
    ForEach(items) { item in
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? Color("AccentOrange") : .secondary)

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.body)

                if let note = item.note {
                    Text(note)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
    .onDelete(perform: deleteItems)
}
.listStyle(.insetGrouped) // または .plain
```

#### セクション付きList

```swift
List {
    Section("今日") {
        ForEach(todayItems) { item in
            ItemRow(item: item)
        }
    }

    Section("今週") {
        ForEach(weekItems) { item in
            ItemRow(item: item)
        }
    }
}
.listStyle(.insetGrouped)
```

### ボタン

#### プライマリボタン

```swift
Button("追加") {
    // アクション
}
.buttonStyle(.borderedProminent)
.tint(Color("AccentOrange"))
```

#### セカンダリボタン

```swift
Button("キャンセル") {
    // アクション
}
.buttonStyle(.bordered)
```

#### テキストボタン

```swift
Button("詳細を見る") {
    // アクション
}
.buttonStyle(.plain)
.foregroundStyle(Color("AccentOrange"))
```

### フォーム

```swift
Form {
    Section("基本情報") {
        TextField("名前", text: $name)
        TextField("メモ", text: $note)
    }

    Section("設定") {
        Toggle("通知を有効化", isOn: $isNotificationEnabled)

        Picker("頻度", selection: $frequency) {
            Text("毎日").tag(Frequency.daily)
            Text("毎週").tag(Frequency.weekly)
        }
    }

    Section {
        Button("保存") {
            // 保存処理
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color("AccentOrange"))
    }
}
```

### シート・アラート

#### Sheet(モーダル)

```swift
.sheet(isPresented: $showingAddItem) {
    AddItemView()
}
```

#### Alert(アラート)

```swift
.alert("削除しますか?", isPresented: $showingDeleteAlert) {
    Button("キャンセル", role: .cancel) { }
    Button("削除", role: .destructive) {
        // 削除処理
    }
}
```

---

## レイアウト

### スペーシング

iOS標準のスペーシング規則に従います。

```swift
// 標準パディング(16pt)
.padding()

// 方向別パディング
.padding(.horizontal)     // 左右のみ
.padding(.vertical)       // 上下のみ
.padding(.top)           // 上のみ

// カスタム値(最小限に)
.padding(.horizontal, 20)
.padding(.vertical, 8)

// Spacer
Spacer()                 // 可変スペース
Spacer(minLength: 8)     // 最小値付きスペース
```

### コーナー半径

```swift
// 標準的な丸み
.cornerRadius(10)

// より丸い
.cornerRadius(12)

// RoundedRectangle使用
.clipShape(RoundedRectangle(cornerRadius: 10))
```

### シャドウ

```swift
// 控えめなシャドウ(必要な場合のみ)
.shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)

// カード用シャドウ
.shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
```

---

## アクセシビリティ

### ダイナミックタイプ

```swift
// 自動対応(システムフォント使用時)
Text("テキスト")
    .font(.body)

// カスタムサイズも対応
@ScaledMetric var customSize: CGFloat = 16

Text("カスタムテキスト")
    .font(.system(size: customSize))
```

### VoiceOver

```swift
Button {
    addItem()
} label: {
    Image(systemName: "plus")
}
.accessibilityLabel("新しいアイテムを追加")
.accessibilityHint("タップして買い物リストにアイテムを追加します")

// 装飾的な要素は非表示
Image(systemName: "sparkles")
    .accessibilityHidden(true)
```

### カラーコントラスト

- iOS Semantic Colorsは自動的にWCAG AA基準をクリア
- アクセントカラー(#FF9500)は白背景で十分なコントラスト比(4.6:1)を確保
- ダークモードでは自動的に調整された色が適用される

### Reduce Motion対応

```swift
@Environment(\.accessibilityReduceMotion) var reduceMotion

var animation: Animation? {
    reduceMotion ? nil : .easeInOut
}

Button("アニメーション") {
    withAnimation(animation) {
        // アニメーション処理
    }
}
```

---

## ダークモード

### 自動対応

iOS Semantic Colorsを使用することで、追加実装なしでダークモードに対応します。

```swift
// 自動的にライト/ダーク両対応
.foregroundStyle(.primary)
.background(.secondaryBackground)
```

### カスタムカラーの対応

Assets.xcassetsでAppearancesを設定:

```
AccentOrange.colorset/
├── Contents.json
└── Colors:
    - Any: #FF9500
    - Dark: #FF9F0A
```

### プレビュー確認

```swift
#Preview {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
```

---

## 主要画面UI構成例

### 1. タブバー構造 ✅ 実装済み

**実装ファイル**: [ios/kajilis/ContentView.swift](../../ios/kajilis/ContentView.swift)

```swift
// ContentView.swift
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
```

**実装状況**:
- ✅ 4つのタブ実装完了
- ✅ アクセントカラー適用済み (`kajilisApp.swift` で `.tint(Color.accentColor)`)
- ✅ 各Viewは独自にNavigationStackを持つ構造

**注意**: 初期設計では各Viewを`NavigationStack`でラップしていましたが、実装では各View内部で`NavigationStack`を定義する方式を採用しました。これにより、各画面が独立したナビゲーション階層を持ちます。

### 2. 買い物リスト画面 ✅ 基本構造実装済み

**実装ファイル**: [ios/kajilis/Views/Shopping/ShoppingListView.swift](../../ios/kajilis/Views/Shopping/ShoppingListView.swift)

```swift
// ShoppingListView.swift (現在の実装)
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
```

**実装状況**:
- ✅ NavigationStack構造
- ✅ 空のList表示
- ✅ ツールバーに+ボタン配置
- ⏳ データモデル実装待ち
- ⏳ アイテム追加機能実装待ち
- ⏳ アイテム表示・編集・削除機能実装待ち

struct ShoppingItemRow: View {
    let item: ShoppingItem

    var body: some View {
        HStack {
            Image(systemName: item.isPurchased ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isPurchased ? Color("AccentOrange") : .secondary)
                .font(.title2)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.body)
                    .strikethrough(item.isPurchased)

                if let note = item.note, !note.isEmpty {
                    Text(note)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            if let quantity = item.quantity {
                Text(quantity)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            // トグル処理
        }
    }
}
```

### 3. タスク一覧画面 ✅ 基本構造実装済み

**実装ファイル**: [ios/kajilis/Views/Tasks/TaskListView.swift](../../ios/kajilis/Views/Tasks/TaskListView.swift)

```swift
// TaskListView.swift (現在の実装)
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
```

**実装状況**:
- ✅ NavigationStack構造
- ✅ 空のList表示
- ✅ ツールバーに+ボタン配置
- ⏳ データモデル実装待ち
- ⏳ タスク追加機能実装待ち
- ⏳ タスク表示・編集・完了機能実装待ち
- ⏳ セクション分け(今日/今週)実装待ち

struct TaskRow: View {
    let task: Task

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? Color("AccentOrange") : .secondary)
                .font(.title2)

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.body)
                    .strikethrough(task.isCompleted)

                HStack(spacing: 8) {
                    Label(task.assignee, systemImage: "person")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    if let dueTime = task.dueTime {
                        Label(dueTime, systemImage: "clock")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}
```

### 4. 献立画面 ✅ 基本構造実装済み

**実装ファイル**: [ios/kajilis/Views/Menu/MenuPlanView.swift](../../ios/kajilis/Views/Menu/MenuPlanView.swift)

```swift
// MenuPlanView.swift (現在の実装)
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
```

**実装状況**:
- ✅ NavigationStack構造
- ✅ 空のList表示
- ✅ ツールバーに+ボタン配置
- ⏳ データモデル実装待ち
- ⏳ 献立追加機能実装待ち
- ⏳ 献立表示・編集機能実装待ち

### 5. 設定画面 ✅ 基本構造実装済み

**実装ファイル**: [ios/kajilis/Views/Settings/SettingsView.swift](../../ios/kajilis/Views/Settings/SettingsView.swift)

```swift
// SettingsView.swift (現在の実装)
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
```

**実装状況**:
- ✅ NavigationStack構造
- ✅ Form使用
- ✅ 通知トグル実装済み
- ✅ バージョン情報表示
- ⏳ テーマ設定機能実装待ち
- ⏳ 家族メンバー管理機能実装待ち
- ⏳ その他設定項目実装待ち

---

## 実装ガイドライン

### ファイル構成

```
ios/kajilis/
├── App/
│   └── KajilisApp.swift              # アプリエントリーポイント
├── Views/
│   ├── ContentView.swift             # メインTabView
│   ├── Shopping/
│   │   ├── ShoppingListView.swift    # 買い物リスト画面
│   │   ├── ShoppingItemRow.swift     # 買い物アイテム行
│   │   └── AddShoppingItemView.swift # アイテム追加画面
│   ├── Menu/
│   │   ├── MenuPlanView.swift        # 献立画面
│   │   └── MenuDetailView.swift      # 献立詳細
│   ├── Tasks/
│   │   ├── TaskListView.swift        # タスク一覧画面
│   │   ├── TaskRow.swift             # タスク行
│   │   └── AddTaskView.swift         # タスク追加画面
│   └── Settings/
│       ├── SettingsView.swift        # 設定画面
│       └── NotificationSettingsView.swift
├── Models/
│   ├── ShoppingItem.swift
│   ├── Task.swift
│   └── MenuPlan.swift
├── ViewModels/
│   ├── ShoppingListViewModel.swift
│   └── TaskListViewModel.swift
└── Assets.xcassets/
    ├── AccentColor.colorset/
    ├── AccentOrange.colorset/        # カスタムアクセントカラー
    └── AppIcon.appiconset/
```

### 命名規則

#### View

```swift
// 画面: 機能名 + View
struct ShoppingListView: View { }
struct SettingsView: View { }

// コンポーネント: 要素名 + Row/Card/Button等
struct TaskRow: View { }
struct MenuCard: View { }
struct AddButton: View { }
```

#### Model

```swift
// 単数形
struct ShoppingItem: Identifiable, Codable { }
struct Task: Identifiable, Codable { }
struct User: Identifiable, Codable { }
```

#### ViewModel

```swift
// 機能名 + ViewModel
class ShoppingListViewModel: ObservableObject { }
class TaskListViewModel: ObservableObject { }
```

### コーディング規約

```swift
// MARK: - で機能ブロックを区切る
struct ShoppingListView: View {
    // MARK: - Properties
    @State private var items: [ShoppingItem] = []
    @State private var showingAddItem = false

    // MARK: - Body
    var body: some View {
        // UI実装
    }

    // MARK: - Methods
    private func addItem() {
        // 処理
    }

    private func deleteItems(at offsets: IndexSet) {
        // 処理
    }
}
```

---

## 実装状況

### ✅ 完了した実装

#### 1. カラーシステム
- [x] `AccentColor` カラーアセットをオレンジ色に設定 (#FF9500 / #FF9F0A)
- [x] `KajilisApp.swift` にアクセントカラーを適用
- [x] ライト/ダークモード対応完了

#### 2. 基本UI構造
- [x] TabView構造の実装完了
- [x] 4つの主要画面を作成:
  - `ShoppingListView` - 買い物リスト
  - `MenuPlanView` - 献立
  - `TaskListView` - タスク
  - `SettingsView` - 設定

### 実装済みファイル構造

```
ios/kajilis/
├── kajilisApp.swift                      # アクセントカラー適用済み
├── ContentView.swift                     # TabView構造実装済み
├── Views/
│   ├── Shopping/
│   │   └── ShoppingListView.swift       # 買い物リスト画面
│   ├── Menu/
│   │   └── MenuPlanView.swift           # 献立画面
│   ├── Tasks/
│   │   └── TaskListView.swift           # タスク画面
│   └── Settings/
│       └── SettingsView.swift           # 設定画面
└── Assets.xcassets/
    └── AccentColor.colorset/            # オレンジ色設定済み
```

## 次のステップ

### 2. 機能開発(Kiro Spec-Driven Development)

1. `/kiro:spec-init` - 機能仕様の初期化
2. `/kiro:spec-requirements` - 要件定義
3. `/kiro:spec-design` - 技術設計
4. `/kiro:spec-tasks` - 実装タスク分解
5. `/kiro:spec-impl` - TDD方式での実装

### 3. デザインレビューポイント

- [ ] 標準コンポーネントを使用しているか
- [ ] アクセントカラーは適切な箇所に使用されているか
- [ ] ダイナミックタイプに対応しているか
- [ ] VoiceOver対応は適切か
- [ ] ライト/ダークモード両方で確認したか

---

## 参考リソース

### Apple公式ドキュメント

- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines)
- [SF Symbols](https://developer.apple.com/sf-symbols/)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [Color - HIG](https://developer.apple.com/design/human-interface-guidelines/color)
- [Typography - HIG](https://developer.apple.com/design/human-interface-guidelines/typography)
- [Accessibility - HIG](https://developer.apple.com/design/human-interface-guidelines/accessibility)

### デザインリソース

- [Apple Design Resources](https://developer.apple.com/design/resources/)
- [iOS 17 Design Kit (Figma)](https://www.figma.com/community/file/768726224729434956)
- [SF Symbols App](https://developer.apple.com/sf-symbols/) - macOSアプリでアイコン検索

### 学習リソース

- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Develop in Swift Tutorials](https://developer.apple.com/tutorials/develop-in-swift)

---

## デザインシステムのメリット

### 開発効率

- **実装速度**: 標準コンポーネントで開発時間を大幅短縮
- **AI連携**: AIエージェントへの指示が明確で実装ミスが少ない
- **保守性**: コード量が少なく、保守しやすい

### ユーザー体験

- **直感性**: iOSユーザーが慣れ親しんだUI
- **一貫性**: Appleの標準に従った統一感
- **アクセシビリティ**: 自動的にWCAG基準をクリア

### 拡張性

- **カスタマイズ**: 必要に応じて段階的にカスタマイズ可能
- **スケーラビリティ**: 機能追加が容易
- **将来性**: OSアップデートに自動追従

---

このデザインシステムに従うことで、デザイン経験が少なくても、プロフェッショナルで使いやすいiOSアプリを効率的に開発できます。
