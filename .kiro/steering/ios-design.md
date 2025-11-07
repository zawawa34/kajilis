# Kajilis iOS Design System

**バージョン**: v1.0.0
**最終更新**: 2025-11-07

## 目次

1. [概要](#概要)
2. [デザイン原則](#デザイン原則)
3. [カラーシステム](#カラーシステム)
4. [タイポグラフィ](#タイポグラフィ)
5. [スペーシングシステム](#スペーシングシステム)
6. [コンポーネントライブラリ](#コンポーネントライブラリ)
7. [レイアウトパターン](#レイアウトパターン)
8. [アイコンシステム](#アイコンシステム)
9. [アニメーション](#アニメーション)
10. [アクセシビリティ](#アクセシビリティ)
11. [コーディング規約](#コーディング規約)
12. [バージョン履歴](#バージョン履歴)

---

## 概要

### 目的

Kajilis iOSデザインシステムは、AIエージェント（Claude Codeなど）と開発者が実装時にデザインの一貫性を維持できるよう、包括的なガイドラインを提供します。本ドキュメントは、SwiftUIベースのKajilisアプリケーション開発における、すべてのUI/UX実装の基準となります。

### デザインシステムの目標

- **一貫性**: アプリ全体で統一されたビジュアル言語とインタラクションパターンを実現
- **効率性**: 再利用可能なコンポーネントとパターンにより、開発速度を向上
- **アクセシビリティ**: すべてのユーザーにとって使いやすいUIを実現
- **保守性**: 明確なガイドラインにより、長期的なメンテナンスを容易に

### 対象読者

- AIエージェント（実装時の参照ドキュメント）
- iOS開発者（Swift/SwiftUI実装者）
- デザイナー（UIデザイン作成者）
- プロジェクト関係者（デザイン方針の理解）

---

## デザイン原則

Kajilisデザインシステムは、以下の5つの基本原則に基づいて構築されています。

### 1. シンプリシティ（簡潔性）

- **最小限のUI要素**: 必要な情報のみを表示し、ユーザーの認知負荷を軽減
- **明確な階層構造**: 情報の重要度が視覚的に理解できるデザイン
- **直感的な操作**: 説明不要で理解できるインタラクション

### 2. コンシステンシー（一貫性）

- **統一されたビジュアル言語**: カラー、タイポグラフィ、スペーシングの一貫した使用
- **予測可能な動作**: 同じインタラクションには同じ結果を提供
- **パターンの再利用**: 確立されたUIパターンを繰り返し使用

### 3. アクセシビリティ

- **WCAG 2.1 AA準拠**: カラーコントラスト比4.5:1以上を確保
- **VoiceOver対応**: すべてのインタラクティブ要素に適切なラベル
- **Dynamic Type対応**: ユーザーのフォントサイズ設定に追従

### 4. パフォーマンス

- **軽量なUI**: スムーズなスクロールとアニメーションを実現
- **レスポンシブ**: デバイスサイズに応じた最適なレイアウト
- **効率的な描画**: SwiftUIのベストプラクティスに準拠

### 5. 拡張性

- **モジュラー設計**: 独立したコンポーネントで構成
- **カスタマイズ可能**: プロパティによる柔軟な調整
- **将来の拡張**: 新機能追加時のガイドライン

---

## カラーシステム

Kajilisのカラーシステムは、iOS標準のシステムカラーをベースに、家族向けの温かみと使いやすさを重視した設計です。すべてのカラーはライトモード・ダークモードの両方に対応し、アクセシビリティ基準（WCAG 2.1 AA）を満たします。

### ブランドカラー

#### プライマリカラー（Primary）

アプリの主要なアクションとブランドアイデンティティを表現するカラーです。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#007AFF` | 主要ボタン、アクティブな状態、リンク |
| Dark | `#0A84FF` | 主要ボタン、アクティブな状態、リンク |

**使用例**:
- プライマリボタンの背景色
- 選択中のタブアイコン
- アクティブな入力フィールドの枠線
- リンクテキスト

```swift
// SwiftUI実装例
Button("タスクを追加") {
    // アクション
}
.buttonStyle(.borderedProminent)
.tint(Color("primaryColor")) // Assets.xcassetsで定義
```

#### セカンダリカラー（Secondary）

補助的なUIエレメントや、プライマリカラーとの組み合わせで使用するカラーです。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#FF9500` | セカンダリボタン、強調表示、温かみのあるアクセント |
| Dark | `#FF9F0A` | セカンダリボタン、強調表示、温かみのあるアクセント |

**使用例**:
- セカンダリボタンの背景色
- 重要な通知バッジ
- カテゴリータグの背景色
- 期日が近いタスクのハイライト

```swift
// SwiftUI実装例
Button("詳細を見る") {
    // アクション
}
.buttonStyle(.bordered)
.tint(Color("secondaryColor"))
```

#### アクセントカラー（Accent）

成功状態や完了アクションなど、ポジティブなフィードバックに使用します。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#34C759` | 成功メッセージ、完了状態、ポジティブなアクション |
| Dark | `#30D158` | 成功メッセージ、完了状態、ポジティブなアクション |

**使用例**:
- 完了チェックマーク
- 成功トースト通知
- 「保存しました」などの成功メッセージ
- 完了済みタスクの背景色

```swift
// SwiftUI実装例
HStack {
    Image(systemName: "checkmark.circle.fill")
        .foregroundStyle(Color("accentColor"))
    Text("タスクを完了しました")
}
```

### カラー命名規則

カラー名は**セマンティック（意味論的）命名**を採用し、用途が明確に分かるようにします。

**命名パターン**:
- `primaryColor`: プライマリカラー
- `secondaryColor`: セカンダリカラー
- `accentColor`: アクセントカラー
- `successColor`: 成功状態
- `warningColor`: 警告状態
- `errorColor`: エラー状態
- `infoColor`: 情報表示
- `backgroundPrimary`: 主背景色
- `backgroundSecondary`: 副背景色
- `backgroundTertiary`: 3次背景色

**避けるべき命名**:
- ❌ `blue500`, `red700` などの色相ベース命名
- ❌ `color1`, `color2` などの番号ベース命名

### Assets.xcassetsでの実装

SwiftUIでカラーを使用するには、`Assets.xcassets`にColor Setを作成します。

#### 手順

1. **Xcodeでプロジェクトを開く**
2. **Assets.xcassetsを選択**
3. **右クリック → New Color Set**
4. **カラー名を設定**（例: `primaryColor`）
5. **Appearancesを"Any, Light, Dark"に設定**
6. **Light modeとDark modeそれぞれにカラー値を設定**

#### 設定例（primaryColor）

```
primaryColor (Color Set)
├── Any Appearance: None（未使用）
├── Light Appearance: #007AFF
└── Dark Appearance: #0A84FF
```

#### SwiftUIでの参照方法

```swift
// 方法1: Assets.xcassetsのColor Setを参照
Color("primaryColor")

// 方法2: 拡張を使って定義（推奨）
extension Color {
    static let primaryColor = Color("primaryColor")
    static let secondaryColor = Color("secondaryColor")
    static let accentColor = Color("accentColor")
}

// 使用例
Text("Hello, Kajilis!")
    .foregroundColor(.primaryColor)
```

### カラーアクセシビリティ

すべてのカラーの組み合わせは、WCAG 2.1 AA基準（コントラスト比4.5:1以上）を満たす必要があります。

#### コントラスト比の確認方法

**推奨ツール**:
- [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)
- Xcode Accessibility Inspector
- Figma Contrast Plugin

#### ブランドカラーのコントラスト比

| カラー | 背景 | コントラスト比 | 評価 |
|--------|------|--------------|------|
| Primary (Light #007AFF) | White (#FFFFFF) | 4.51:1 | ✅ AA |
| Primary (Dark #0A84FF) | Black (#000000) | 8.59:1 | ✅ AAA |
| Secondary (Light #FF9500) | White (#FFFFFF) | 3.03:1 | ⚠️ Large text only |
| Secondary (Dark #FF9F0A) | Black (#000000) | 5.47:1 | ✅ AA |

**注意**: セカンダリカラー（Light）は小さいテキストには使用せず、大きな見出しやボタン背景に限定します。

### ベストプラクティス

#### DO（推奨）

✅ セマンティックカラー名を使用
```swift
Button("保存") { }
    .tint(.primaryColor) // ✅ 意図が明確
```

✅ システムカラーとの調和
```swift
// iOS標準のセマンティックカラーと併用
Text("エラーメッセージ")
    .foregroundColor(.red) // システム標準
```

✅ Dynamic Colorに対応
```swift
// Assets.xcassetsで定義したカラーは自動的にDynamic Color対応
Color("primaryColor") // ライト/ダークモード自動切り替え
```

#### DON'T（非推奨）

❌ ハードコードされたカラー値
```swift
Button("保存") { }
    .tint(Color(red: 0, green: 0.478, blue: 1)) // ❌ 保守困難
```

❌ 用途と異なる命名
```swift
Color("buttonBlue") // ❌ 実装依存の命名
```

❌ コントラスト比を無視
```swift
Text("重要な情報")
    .foregroundColor(Color(white: 0.9)) // ❌ 白背景で読みにくい
    .background(.white)
```

### 状態カラー (State Colors)

状態カラーは、ユーザーへのフィードバックやメッセージの種類を視覚的に伝えるために使用します。すべての状態カラーはライトモード・ダークモードに対応し、アクセシビリティ基準を満たします。

#### 成功カラー (Success)

操作の成功やポジティブなフィードバックを示すカラーです。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#34C759` | 成功メッセージ、完了状態、確認アイコン |
| Dark | `#30D158` | 成功メッセージ、完了状態、確認アイコン |

**使用例**:
- タスク完了時のチェックマーク
- 「保存しました」などの成功トースト
- フォーム送信完了メッセージ
- 完了済みタスクのステータス表示

```swift
// SwiftUI実装例
HStack {
    Image(systemName: "checkmark.circle.fill")
        .foregroundStyle(Color(\"successColor\"))
    Text(\"タスクを完了しました\")
}
.padding()
.background(Color(\"successColor\").opacity(0.1))
.cornerRadius(8)
```

#### 警告カラー (Warning)

注意が必要な状況や、軽微な問題を示すカラーです。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#FF9500` | 警告メッセージ、注意事項、期限接近 |
| Dark | `#FF9F0A` | 警告メッセージ、注意事項、期限接近 |

**使用例**:
- 期限が近いタスクの通知
- 確認が必要なアクション前の警告
- 軽微なバリデーションエラー
- ストレージ容量警告

```swift
// SwiftUI実装例
HStack {
    Image(systemName: "exclamationmark.triangle.fill")
        .foregroundStyle(Color(\"warningColor\"))
    Text(\"期限まであと1日です\")
}
.padding()
.background(Color(\"warningColor\").opacity(0.1))
.cornerRadius(8)
```

#### エラーカラー (Error)

エラーや失敗した操作、重大な問題を示すカラーです。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#FF3B30` | エラーメッセージ、失敗状態、削除アクション |
| Dark | `#FF453A` | エラーメッセージ、失敗状態、削除アクション |

**使用例**:
- フォームバリデーションエラー
- ネットワークエラーメッセージ
- 削除確認ダイアログ
- 必須項目の未入力表示

```swift
// SwiftUI実装例
VStack(alignment: .leading, spacing: 4) {
    TextField(\"メールアドレス\", text: $email)
        .textFieldStyle(.roundedBorder)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(\"errorColor\"), lineWidth: 1)
        )

    HStack(spacing: 4) {
        Image(systemName: \"xmark.circle.fill\")
        Text(\"有効なメールアドレスを入力してください\")
    }
    .font(.caption)
    .foregroundStyle(Color(\"errorColor\"))
}
```

#### 情報カラー (Info)

中立的な情報やヒントを示すカラーです。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#007AFF` | 情報メッセージ、ヒント、ガイド |
| Dark | `#0A84FF` | 情報メッセージ、ヒント、ガイド |

**使用例**:
- 操作ヒントやツールチップ
- 機能説明メッセージ
- 新機能の案内
- 中立的な通知

```swift
// SwiftUI実装例
HStack {
    Image(systemName: \"info.circle.fill\")
        .foregroundStyle(Color(\"infoColor\"))
    Text(\"タスクをスワイプして削除できます\")
}
.padding()
.background(Color(\"infoColor\").opacity(0.1))
.cornerRadius(8)
```

#### 状態カラーの使用ガイドライン

**適切な使用場面**:
- ✅ **Success**: 操作完了、目標達成、データ保存成功
- ✅ **Warning**: 期限接近、容量不足、確認推奨
- ✅ **Error**: バリデーションエラー、操作失敗、システムエラー
- ✅ **Info**: 使い方のヒント、機能説明、中立的な通知

**避けるべき使用**:
- ❌ ブランドカラーとしての使用（状態表現に限定）
- ❌ 装飾目的のみでの使用
- ❌ 複数の状態カラーを同時に使用（混乱を招く）

### 背景レイヤー (Background Layers)

背景レイヤーは、UIの階層構造と深度を表現するために使用します。3段階のレイヤーを定義し、コンテンツの重要度と視覚的な分離を実現します。

#### プライマリ背景 (Primary Background)

アプリケーションの最も基本的な背景色です。画面全体のベース色として使用します。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#FFFFFF` (System Background) | 画面全体の基本背景 |
| Dark | `#000000` (System Background) | 画面全体の基本背景 |

**使用例**:
- メイン画面の背景
- リスト画面の背景
- フォーム画面の背景

```swift
// SwiftUI実装例
ZStack {
    Color(\"backgroundPrimary\")
        .ignoresSafeArea()

    VStack {
        // コンテンツ
    }
}
```

#### セカンダリ背景 (Secondary Background)

プライマリ背景の上に配置されるコンテンツグループやカードの背景色です。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#F2F2F7` (System Grouped Background) | カード、グループ化されたコンテンツ |
| Dark | `#1C1C1E` (System Grouped Background) | カード、グループ化されたコンテンツ |

**使用例**:
- カードコンポーネントの背景
- グループ化されたリストアイテム
- セクション分けされた領域

```swift
// SwiftUI実装例
VStack(spacing: 16) {
    ForEach(tasks) { task in
        TaskCardView(task: task)
            .background(Color(\"backgroundSecondary\"))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
    }
}
.padding()
.background(Color(\"backgroundPrimary\"))
```

#### ターシャリ背景 (Tertiary Background)

セカンダリ背景の上にさらに配置される、より細かいコンテンツの背景色です。

| モード | カラー値 | 用途 |
|--------|---------|------|
| Light | `#FFFFFF` (System Tertiary Background) | 入力フィールド、ネストされた要素 |
| Dark | `#2C2C2E` (System Tertiary Background) | 入力フィールド、ネストされた要素 |

**使用例**:
- カード内の入力フィールド背景
- ネストされたコンテンツ領域
- セカンダリ背景内でのさらなる区分け

```swift
// SwiftUI実装例
VStack(spacing: 12) {
    Text(\"タスク詳細\")
        .font(.headline)

    // ターシャリ背景を使用した入力フィールド
    TextField(\"タスク名\", text: $taskName)
        .padding()
        .background(Color(\"backgroundTertiary\"))
        .cornerRadius(8)
}
.padding()
.background(Color(\"backgroundSecondary\"))
.cornerRadius(12)
```

#### 背景レイヤーの使用ガイドライン

**階層の原則**:
1. **Primary → Secondary → Tertiary** の順で深度を表現
2. 各レイヤーは前のレイヤーの上に配置される
3. 深度の違いで視覚的なグルーピングを実現

**適切な使用場面**:
- ✅ **Primary**: 画面全体の基本背景、ベースとなるビュー
- ✅ **Secondary**: カード、リストアイテム、セクション区切り
- ✅ **Tertiary**: 入力フィールド、ネストされた詳細情報

**ベストプラクティス**:
```swift
// ✅ DO: 階層に応じた背景レイヤー
ScrollView {
    VStack(spacing: 16) {
        ForEach(sections) { section in
            VStack(alignment: .leading, spacing: 8) {
                Text(section.title)
                    .font(.headline)

                ForEach(section.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        TextField(\"値\", text: $item.value)
                            .padding(8)
                            .background(Color(\"backgroundTertiary\")) // 3層目
                            .cornerRadius(6)
                    }
                }
            }
            .padding()
            .background(Color(\"backgroundSecondary\")) // 2層目
            .cornerRadius(12)
        }
    }
    .padding()
}
.background(Color(\"backgroundPrimary\")) // 1層目

// ❌ DON'T: 階層を飛ばす
VStack {
    TextField(\"入力\", text: $text)
        .background(Color(\"backgroundTertiary\")) // ❌ Secondaryを飛ばしている
}
.background(Color(\"backgroundPrimary\"))
```

#### Assets.xcassetsでの実装

状態カラーと背景レイヤーも、ブランドカラーと同様にAssets.xcassetsで定義します。

**追加するColor Sets**:
```
Assets.xcassets/
├── successColor (Color Set)
├── warningColor (Color Set)
├── errorColor (Color Set)
├── infoColor (Color Set)
├── backgroundPrimary (Color Set)
├── backgroundSecondary (Color Set)
└── backgroundTertiary (Color Set)
```

**SwiftUIでの一括定義** (推奨):
```swift
extension Color {
    // ブランドカラー
    static let primaryColor = Color(\"primaryColor\")
    static let secondaryColor = Color(\"secondaryColor\")
    static let accentColor = Color(\"accentColor\")

    // 状態カラー
    static let successColor = Color(\"successColor\")
    static let warningColor = Color(\"warningColor\")
    static let errorColor = Color(\"errorColor\")
    static let infoColor = Color(\"infoColor\")

    // 背景レイヤー
    static let backgroundPrimary = Color(\"backgroundPrimary\")
    static let backgroundSecondary = Color(\"backgroundSecondary\")
    static let backgroundTertiary = Color(\"backgroundTertiary\")
}
```

### SwiftUI実装ガイド（統合）

このセクションでは、Kajilisカラーシステム全体をSwiftUIプロジェクトに実装する手順を包括的に説明します。

#### ステップ1: Assets.xcassetsでColor Setsを作成

Xcodeプロジェクトで、すべてのカラートークンをColor Setとして定義します。

**手順**:

1. **Xcodeでプロジェクトを開く**
   ```bash
   cd ios
   open kajilis.xcodeproj
   ```

2. **Assets.xcassetsを選択**
   - プロジェクトナビゲーターで`Assets.xcassets`をクリック

3. **Color Setを追加**
   - Assets.xcassetsの空白エリアで右クリック
   - **New Color Set**を選択
   - Color Setの名前を入力（例: `primaryColor`）

4. **Appearanceを設定**
   - Attributes Inspector（右サイドバー）を開く
   - **Appearances**を**Any, Light, Dark**に設定

5. **カラー値を設定**
   - **Light Appearance**をクリックし、カラー値を入力（例: `#007AFF`）
   - **Dark Appearance**をクリックし、カラー値を入力（例: `#0A84FF`）

**作成するColor Sets一覧**:

```
Assets.xcassets/
├── ブランドカラー
│   ├── primaryColor (Light: #007AFF, Dark: #0A84FF)
│   ├── secondaryColor (Light: #FF9500, Dark: #FF9F0A)
│   └── accentColor (Light: #34C759, Dark: #30D158)
├── 状態カラー
│   ├── successColor (Light: #34C759, Dark: #30D158)
│   ├── warningColor (Light: #FF9500, Dark: #FF9F0A)
│   ├── errorColor (Light: #FF3B30, Dark: #FF453A)
│   └── infoColor (Light: #007AFF, Dark: #0A84FF)
└── 背景レイヤー
    ├── backgroundPrimary (Light: #FFFFFF, Dark: #000000)
    ├── backgroundSecondary (Light: #F2F2F7, Dark: #1C1C1E)
    └── backgroundTertiary (Light: #FFFFFF, Dark: #2C2C2E)
```

**注意**: `successColor`と`accentColor`、`warningColor`と`secondaryColor`、`infoColor`と`primaryColor`は同じカラー値ですが、セマンティックな意味が異なるため、別々のColor Setとして定義します。

#### ステップ2: Color拡張を作成

SwiftUIプロジェクトに`Color+Extensions.swift`ファイルを作成し、カラートークンを型安全にアクセスできるようにします。

**ファイルの作成**:

1. Xcodeでプロジェクトナビゲーターを開く
2. `kajilis`グループを右クリック → **New File...**
3. **Swift File**を選択 → **Next**
4. ファイル名を`Color+Extensions.swift`に設定 → **Create**

**実装コード**:

```swift
//
//  Color+Extensions.swift
//  kajilis
//
//  Kajilisデザインシステムのカラートークン拡張
//

import SwiftUI

extension Color {
    // MARK: - ブランドカラー

    /// プライマリカラー - 主要なアクションとブランドアイデンティティ
    /// - Light: #007AFF, Dark: #0A84FF
    static let primaryColor = Color("primaryColor")

    /// セカンダリカラー - 補助的なUIエレメント
    /// - Light: #FF9500, Dark: #FF9F0A
    static let secondaryColor = Color("secondaryColor")

    /// アクセントカラー - 成功状態とポジティブなフィードバック
    /// - Light: #34C759, Dark: #30D158
    static let accentColor = Color("accentColor")

    // MARK: - 状態カラー

    /// 成功カラー - 操作成功とポジティブなフィードバック
    /// - Light: #34C759, Dark: #30D158
    static let successColor = Color("successColor")

    /// 警告カラー - 注意が必要な状況
    /// - Light: #FF9500, Dark: #FF9F0A
    static let warningColor = Color("warningColor")

    /// エラーカラー - エラーと失敗した操作
    /// - Light: #FF3B30, Dark: #FF453A
    static let errorColor = Color("errorColor")

    /// 情報カラー - 中立的な情報とヒント
    /// - Light: #007AFF, Dark: #0A84FF
    static let infoColor = Color("infoColor")

    // MARK: - 背景レイヤー

    /// プライマリ背景 - 画面全体の基本背景
    /// - Light: #FFFFFF, Dark: #000000
    static let backgroundPrimary = Color("backgroundPrimary")

    /// セカンダリ背景 - カードとグループ化されたコンテンツ
    /// - Light: #F2F2F7, Dark: #1C1C1E
    static let backgroundSecondary = Color("backgroundSecondary")

    /// ターシャリ背景 - 入力フィールドとネストされた要素
    /// - Light: #FFFFFF, Dark: #2C2C2E
    static let backgroundTertiary = Color("backgroundTertiary")
}
```

**ベストプラクティス**:
- ✅ 各カラーにドキュメントコメントを追加し、用途とカラー値を明記
- ✅ MARK コメントでカラーをグループ化し、可読性を向上
- ✅ 静的プロパティとして定義し、`.primaryColor`のように簡潔にアクセス

#### ステップ3: SwiftUIビューでカラーを使用

定義したカラートークンをSwiftUIビューで使用します。

**基本的な使用例**:

```swift
import SwiftUI

struct TaskRowView: View {
    let task: Task

    var body: some View {
        HStack {
            // アイコンにプライマリカラーを適用
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(.primaryColor)

            // タスク名
            Text(task.name)
                .foregroundStyle(.primary)

            Spacer()

            // 期日が近い場合は警告カラーを表示
            if task.isDueSoon {
                Text("期限接近")
                    .font(.caption)
                    .foregroundStyle(.warningColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.warningColor.opacity(0.1))
                    .cornerRadius(4)
            }
        }
        .padding()
        .background(.backgroundSecondary)
        .cornerRadius(12)
    }
}
```

**背景レイヤーの階層的使用例**:

```swift
struct TaskDetailView: View {
    @State private var taskName = ""
    @State private var taskDescription = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // カード（セカンダリ背景）
                VStack(alignment: .leading, spacing: 12) {
                    Text("タスク情報")
                        .font(.headline)

                    // 入力フィールド（ターシャリ背景）
                    TextField("タスク名", text: $taskName)
                        .padding()
                        .background(.backgroundTertiary)
                        .cornerRadius(8)

                    TextEditor(text: $taskDescription)
                        .frame(height: 120)
                        .padding()
                        .background(.backgroundTertiary)
                        .cornerRadius(8)
                }
                .padding()
                .background(.backgroundSecondary)
                .cornerRadius(12)

                // アクションボタン
                Button {
                    // 保存処理
                } label: {
                    Text("保存")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.primaryColor)
            }
            .padding()
        }
        .background(.backgroundPrimary)
    }
}
```

**状態カラーの使用例**:

```swift
struct MessageBannerView: View {
    enum MessageType {
        case success, warning, error, info

        var color: Color {
            switch self {
            case .success: return .successColor
            case .warning: return .warningColor
            case .error: return .errorColor
            case .info: return .infoColor
            }
        }

        var icon: String {
            switch self {
            case .success: return "checkmark.circle.fill"
            case .warning: return "exclamationmark.triangle.fill"
            case .error: return "xmark.circle.fill"
            case .info: return "info.circle.fill"
            }
        }
    }

    let type: MessageType
    let message: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: type.icon)
                .foregroundStyle(type.color)

            Text(message)
                .foregroundStyle(.primary)

            Spacer()
        }
        .padding()
        .background(type.color.opacity(0.1))
        .cornerRadius(8)
    }
}

// 使用例
struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            MessageBannerView(type: .success, message: "タスクを保存しました")
            MessageBannerView(type: .warning, message: "期限まであと1日です")
            MessageBannerView(type: .error, message: "保存に失敗しました")
            MessageBannerView(type: .info, message: "タスクをスワイプして削除できます")
        }
        .padding()
    }
}
```

#### ステップ4: Dynamic Colorの動作確認

Assets.xcassetsで定義したColor Setは、自動的にiOSのライト/ダークモード切り替えに対応します。

**動作確認手順**:

1. **シミュレーターでアプリを起動**
2. **ライトモードで表示を確認**
   - シミュレーターのSettings → Developer → Dark Appearance = OFF
3. **ダークモードで表示を確認**
   - シミュレーターのSettings → Developer → Dark Appearance = ON
4. **カラーが自動的に切り替わることを確認**

**プレビューでの確認**:

SwiftUIプレビューで両モードを同時に確認できます。

```swift
#Preview {
    VStack {
        TaskRowView(task: Task.sample)
    }
    .padding()
}

#Preview("Dark Mode") {
    VStack {
        TaskRowView(task: Task.sample)
    }
    .padding()
    .preferredColorScheme(.dark)
}
```

#### ステップ5: カラーアクセシビリティの検証

実装したカラーがアクセシビリティ基準を満たしていることを確認します。

**検証方法**:

1. **Xcode Accessibility Inspector**
   - Xcode → Open Developer Tool → Accessibility Inspector
   - シミュレーターまたは実機でアプリを起動
   - Accessibility Inspectorで要素を選択
   - Color Contrast Ratioを確認（4.5:1以上が必須）

2. **VoiceOverでの動作確認**
   - シミュレーターでVoiceOverを有効化（Settings → Accessibility → VoiceOver）
   - カラーのみで情報を伝えていないことを確認
   - すべてのインタラクティブ要素にラベルがあることを確認

3. **Dynamic Typeのテスト**
   - シミュレーターでフォントサイズを変更（Settings → Accessibility → Display & Text Size → Larger Text）
   - レイアウトが破綻しないことを確認

**アクセシビリティベストプラクティス**:

```swift
// ✅ DO: カラーとアイコンの両方で情報を伝える
HStack {
    Image(systemName: "exclamationmark.triangle.fill")
        .foregroundStyle(.warningColor)
    Text("期限まであと1日です")
}

// ❌ DON'T: カラーのみで情報を伝える
Text("期限まであと1日です")
    .foregroundStyle(.warningColor) // VoiceOverユーザーには伝わらない
```

```swift
// ✅ DO: 十分なコントラスト比を確保
Text("重要な情報")
    .foregroundStyle(.primary) // システム標準色（アクセシブル）
    .background(.backgroundSecondary)

// ❌ DON'T: 低コントラスト比
Text("重要な情報")
    .foregroundStyle(.gray.opacity(0.5)) // 読みにくい
    .background(.backgroundSecondary)
```

#### トラブルシューティング

**問題1: カラーが表示されない**

**原因**: Color Setの名前がコードと一致していない

**解決方法**:
```swift
// Assets.xcassetsでのColor Set名を確認
// "primaryColor" と正確に一致している必要がある
Color("primaryColor") // ✅ 正しい
Color("PrimaryColor") // ❌ 大文字小文字が異なる
Color("primary-color") // ❌ ハイフンが含まれている
```

**問題2: ダークモードでカラーが切り替わらない**

**原因**: Appearancesが正しく設定されていない

**解決方法**:
1. Assets.xcassetsでColor Setを選択
2. Attributes Inspectorで**Appearances**を確認
3. **Any, Light, Dark**に設定されていることを確認
4. Light AppearanceとDark Appearanceに異なる値が設定されていることを確認

**問題3: Xcodeでカラーのオートコンプリートが効かない**

**原因**: Color拡張が認識されていない

**解決方法**:
1. プロジェクトをクリーンビルド（Product → Clean Build Folder）
2. Derived Dataを削除（Xcode → Preferences → Locations → Derived Data → 削除）
3. Xcodeを再起動

#### まとめ

このガイドに従うことで、Kajilisカラーシステムを完全にSwiftUIプロジェクトに実装できます。

**実装チェックリスト**:
- [ ] Assets.xcassetsに10個のColor Setを作成
- [ ] 各Color SetでLight/Dark Appearanceを設定
- [ ] `Color+Extensions.swift`を作成
- [ ] 10個のカラートークンをstatic propertyとして定義
- [ ] SwiftUIビューでカラートークンを使用
- [ ] Dynamic Colorの動作を確認
- [ ] アクセシビリティ検証を実施

**次のステップ**:
- タイポグラフィシステムの実装（次のセクション）
- スペーシングシステムの実装
- コンポーネントライブラリの構築

---

## タイポグラフィ

Kajilisのタイポグラフィシステムは、iOSの標準的なテキストスタイルをベースに、読みやすさとアクセシビリティを重視した設計です。すべてのテキストスタイルはDynamic Typeに対応し、ユーザーのフォントサイズ設定に自動的に追従します。

### テキストスタイル階層

SwiftUIの標準的なテキストスタイルを採用し、明確な視覚的階層を構築します。

#### Large Title

画面のメインタイトルや最も重要な情報に使用する最大サイズのテキストスタイルです。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 34pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 41pt (1.2倍) |
| **文字間** | デフォルト (0) |

**使用場面**:
- ナビゲーションバーの大きなタイトル（Large Title mode）
- ウェルカム画面のメインタイトル
- オンボーディング画面の見出し

**使用例**:
```swift
Text("タスク管理")
    .font(.largeTitle)
```

**ビジュアル例**:
```
タスク管理      (34pt, Regular)
```

#### Title

セクションタイトルや画面の主要な見出しに使用します。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 28pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 34pt (1.21倍) |
| **文字間** | デフォルト (0) |

**使用場面**:
- モーダルやシートのタイトル
- 詳細画面のメインタイトル
- セクションの大きな見出し

**使用例**:
```swift
Text("買い物リスト")
    .font(.title)
```

#### Title 2

サブセクションの見出しに使用します。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 22pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 28pt (1.27倍) |
| **文字間** | デフォルト (0) |

**使用場面**:
- カード内のタイトル
- グループ化されたコンテンツの見出し
- 中程度の重要度のセクションタイトル

**使用例**:
```swift
Text("今週の献立")
    .font(.title2)
```

#### Title 3

より小さなセクションやグループの見出しに使用します。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 20pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 25pt (1.25倍) |
| **文字間** | デフォルト (0) |

**使用場面**:
- リストアイテム内の見出し
- フォームセクションのラベル
- 小さなカードのタイトル

**使用例**:
```swift
Text("タスク詳細")
    .font(.title3)
```

#### Headline

強調すべき重要なテキストに使用します。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 17pt (デフォルト) |
| **フォントウェイト** | Semibold (600) |
| **行間** | 22pt (1.29倍) |
| **文字間** | -0.41pt |

**使用場面**:
- リストアイテムのメインテキスト
- ボタンのラベル
- 強調したい情報

**使用例**:
```swift
Text("牛乳を買う")
    .font(.headline)
```

#### Body

本文テキストや一般的なコンテンツに使用する標準スタイルです。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 17pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 22pt (1.29倍) |
| **文字間** | -0.41pt |

**使用場面**:
- メインコンテンツのテキスト
- 説明文
- メッセージ本文
- デフォルトのテキストスタイル

**使用例**:
```swift
Text("家族みんなで共有できるタスク管理アプリです。")
    .font(.body)
```

#### Callout

標準テキストよりわずかに小さく、補足情報に適しています。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 16pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 21pt (1.31倍) |
| **文字間** | -0.32pt |

**使用場面**:
- リストアイテムの補足テキスト
- アクションシートのメッセージ
- 中程度の重要度の情報

**使用例**:
```swift
Text("3つのタスクが完了しました")
    .font(.callout)
```

#### Subheadline

セカンダリ情報やメタデータに使用します。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 15pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 20pt (1.33倍) |
| **文字間** | -0.24pt |

**使用場面**:
- リストアイテムのサブタイトル
- タイムスタンプ
- カテゴリーラベル
- セカンダリ情報

**使用例**:
```swift
Text("2時間前")
    .font(.subheadline)
    .foregroundStyle(.secondary)
```

#### Footnote

注釈や補足的な情報に使用する小さなテキストです。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 13pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 18pt (1.38倍) |
| **文字間** | -0.08pt |

**使用場面**:
- 法的な注記
- 利用規約のテキスト
- 詳細な補足情報
- フッターのテキスト

**使用例**:
```swift
Text("※削除したタスクは復元できません")
    .font(.footnote)
    .foregroundStyle(.secondary)
```

#### Caption

最も小さなテキストスタイルで、補助的な情報に使用します。

| プロパティ | 値 |
|----------|-----|
| **フォントファミリー** | SF Pro (英語), ヒラギノ角ゴシック (日本語) |
| **フォントサイズ** | 12pt (デフォルト) |
| **フォントウェイト** | Regular (400) |
| **行間** | 16pt (1.33倍) |
| **文字間** | 0pt |

**使用場面**:
- バッジのラベル
- 小さな注釈
- アイコンの説明
- 補足的なメタデータ

**使用例**:
```swift
Text("期限切れ")
    .font(.caption)
    .foregroundStyle(.errorColor)
```

### テキストスタイルの使用ガイドライン

#### 階層の原則

1. **Large Title → Title → Title2 → Title3**: 見出しの階層構造を表現
2. **Headline > Body**: 強調度の違いを表現
3. **Body > Callout > Subheadline > Footnote > Caption**: 情報の重要度を表現

#### 適切な使用例

```swift
VStack(alignment: .leading, spacing: 8) {
    // 画面タイトル
    Text("タスク一覧")
        .font(.largeTitle)
        .fontWeight(.bold)

    // セクションタイトル
    Text("今日のタスク")
        .font(.title2)

    // リストアイテム
    VStack(alignment: .leading, spacing: 4) {
        // メインテキスト
        Text("牛乳を買う")
            .font(.headline)

        // サブテキスト
        Text("スーパーで購入")
            .font(.subheadline)
            .foregroundStyle(.secondary)

        // メタ情報
        Text("期限: 今日中")
            .font(.caption)
            .foregroundStyle(.warningColor)
    }
}
```

### 日本語フォントの扱い

#### フォントファミリー

SwiftUIでは、ロケールに応じて自動的に適切なフォントが選択されます。

- **英語・数字**: SF Pro (System Font)
- **日本語**: ヒラギノ角ゴシック (Hiragino Sans)

#### 日本語テキストの推奨設定

日本語テキストは英語テキストよりも視覚的に複雑なため、以下の点に注意します。

**行間の調整**:
```swift
// 日本語が多いテキストブロック
Text("家族みんなで使えるタスク管理アプリです。買い物リストや献立を共有できます。")
    .font(.body)
    .lineSpacing(4) // 日本語の場合は行間を広げる
```

**長い日本語テキストの折り返し**:
```swift
Text("長いテキストが含まれる場合の例です")
    .font(.body)
    .lineLimit(nil) // 無制限に折り返し
    .multilineTextAlignment(.leading) // 左揃え
```

**文字間の調整** (必要に応じて):
```swift
// タイトルなどで文字間を広げる
Text("タスク管理")
    .font(.largeTitle)
    .kerning(1.5) // 文字間を広げる
```

### ベストプラクティス

#### DO（推奨）

✅ **システムのテキストスタイルを使用**
```swift
Text("タスク一覧")
    .font(.largeTitle) // ✅ システム標準
```

✅ **意味的に正しいスタイルを選択**
```swift
VStack(alignment: .leading) {
    Text("タスク名")
        .font(.headline) // ✅ 強調すべきメインテキスト
    Text("詳細説明")
        .font(.subheadline) // ✅ セカンダリ情報
}
```

✅ **ウェイトで強調を表現**
```swift
Text("重要なお知らせ")
    .font(.body)
    .fontWeight(.semibold) // ✅ 通常のbodyテキストを強調
```

#### DON'T（非推奨）

❌ **カスタムフォントサイズをハードコード**
```swift
Text("タイトル")
    .font(.system(size: 28)) // ❌ Dynamic Typeに対応しない
```

❌ **階層を無視したスタイル選択**
```swift
VStack {
    Text("小さな補足")
        .font(.largeTitle) // ❌ 階層構造が不適切
    Text("メインタイトル")
        .font(.caption) // ❌ 重要度が逆転
}
```

❌ **すべてのテキストを同じスタイルで表示**
```swift
VStack {
    Text("タイトル").font(.body)
    Text("サブタイトル").font(.body) // ❌ 階層構造がない
    Text("詳細").font(.body)
}
```

### Dynamic Typeとアクセシビリティ対応

KajilisのタイポグラフィシステムはDynamic Typeを完全にサポートし、すべてのユーザーが快適に利用できるアクセシブルな設計を実現します。

#### Dynamic Typeの概要

Dynamic Typeは、iOSのアクセシビリティ機能で、ユーザーが設定したフォントサイズに応じてテキストサイズが自動的に調整されます。

**サポートされるサイズカテゴリ**:
- **標準サイズ**: XS, S, M (default), L, XL, XXL, XXXL (7段階)
- **アクセシビリティサイズ**: AX1, AX2, AX3, AX4, AX5 (5段階)

**合計**: 12段階のフォントサイズをサポート

#### Dynamic Typeのサポート方法

SwiftUIの標準的なテキストスタイル（`.font(.body)`など）を使用することで、Dynamic Typeが自動的にサポートされます。

**自動対応（推奨）**:
```swift
// ✅ Dynamic Typeに自動対応
Text("タスク一覧")
    .font(.largeTitle)

Text("家族みんなで使えるタスク管理アプリです。")
    .font(.body)
```

**カスタムフォントでDynamic Typeを使用**:
```swift
// カスタムフォントでもDynamic Typeをサポート
Text("タスク名")
    .font(.custom("HiraKakuProN-W6", size: 17, relativeTo: .body))
    // relativeTo: で基準となるテキストスタイルを指定
```

**固定サイズ（非推奨）**:
```swift
// ❌ Dynamic Typeに対応しない（アクセシビリティ違反）
Text("タイトル")
    .font(.system(size: 28)) // 固定サイズは避ける
```

#### アクセシビリティサイズへの対応

アクセシビリティサイズ（AX1〜AX5）では、テキストサイズが大幅に拡大されるため、レイアウトの調整が必要になる場合があります。

**アクセシビリティサイズの検出**:
```swift
import SwiftUI

struct TaskListView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        VStack(spacing: isAccessibilitySize ? 16 : 8) {
            // レイアウト調整
        }
    }

    // アクセシビリティサイズかどうかを判定
    var isAccessibilitySize: Bool {
        dynamicTypeSize >= .accessibility1
    }
}
```

**最大サイズの制限**:
特定の要素で極端に大きなフォントを避ける必要がある場合、最大サイズを制限できます。

```swift
// タブバーのラベルなど、スペースが限られている場合
Text("ホーム")
    .font(.caption)
    .dynamicTypeSize(...DynamicTypeSize.accessibility3)
    // accessibility3までに制限（accessibility4, 5は適用されない）
```

**注意**: 最大サイズの制限は必要最小限にとどめ、できる限り全サイズをサポートすることが推奨されます。

#### レイアウトの調整パターン

アクセシビリティサイズでレイアウトが破綻しないよう、以下のパターンを適用します。

**パターン1: 水平レイアウトから垂直レイアウトへ切り替え**:
```swift
struct TaskRowView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let task: Task

    var body: some View {
        Group {
            if dynamicTypeSize >= .accessibility1 {
                // アクセシビリティサイズでは垂直レイアウト
                VStack(alignment: .leading, spacing: 8) {
                    taskNameView
                    dueDateView
                }
            } else {
                // 標準サイズでは水平レイアウト
                HStack {
                    taskNameView
                    Spacer()
                    dueDateView
                }
            }
        }
        .padding()
        .background(.backgroundSecondary)
        .cornerRadius(12)
    }

    var taskNameView: some View {
        Text(task.name)
            .font(.headline)
    }

    var dueDateView: some View {
        Text(task.dueDate)
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}
```

**パターン2: スペーシングの動的調整**:
```swift
struct ContentView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        VStack(spacing: spacing) {
            // コンテンツ
        }
    }

    // Dynamic Typeサイズに応じてスペーシングを調整
    var spacing: CGFloat {
        switch dynamicTypeSize {
        case .xSmall, .small, .medium:
            return 8
        case .large, .xLarge, .xxLarge, .xxxLarge:
            return 12
        case .accessibility1, .accessibility2:
            return 16
        case .accessibility3, .accessibility4, .accessibility5:
            return 20
        @unknown default:
            return 12
        }
    }
}
```

**パターン3: ViewThatFitsによる自動レイアウト選択**:
```swift
struct AdaptiveTaskRow: View {
    let task: Task

    var body: some View {
        ViewThatFits {
            // 最初に水平レイアウトを試行
            HStack {
                Text(task.name)
                Spacer()
                Text(task.dueDate)
            }

            // 収まらない場合は垂直レイアウトに自動切り替え
            VStack(alignment: .leading) {
                Text(task.name)
                Text(task.dueDate)
            }
        }
        .padding()
        .background(.backgroundSecondary)
        .cornerRadius(12)
    }
}
```

#### 日本語フォントのDynamic Type対応

日本語フォント（ヒラギノ角ゴシック）もDynamic Typeに自動対応しますが、以下の点に注意します。

**推奨設定**:
```swift
// 日本語テキストの基本設定
Text("家族みんなで使えるタスク管理アプリです。買い物リストや献立を共有できます。")
    .font(.body)
    .lineSpacing(4) // 日本語は行間を広げる
    .multilineTextAlignment(.leading)
```

**長い日本語テキストのアクセシビリティ対応**:
```swift
struct DescriptionTextView: View {
    let text: String
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        Text(text)
            .font(.body)
            .lineSpacing(lineSpacing)
            .multilineTextAlignment(.leading)
    }

    // Dynamic Typeサイズに応じて行間を調整
    var lineSpacing: CGFloat {
        if dynamicTypeSize >= .accessibility1 {
            return 8 // アクセシビリティサイズではより広い行間
        } else {
            return 4 // 標準サイズ
        }
    }
}
```

#### フォントスケーリングのベストプラクティス

**DO（推奨）**:

✅ **システムテキストスタイルを使用**
```swift
Text("タスク一覧")
    .font(.largeTitle) // ✅ Dynamic Type自動対応
```

✅ **レイアウトの柔軟性を確保**
```swift
VStack(alignment: .leading) {
    Text("タイトル")
        .font(.headline)
        .lineLimit(nil) // ✅ 無制限に折り返し可能

    Text("説明文が長い場合でも適切に表示されます。")
        .font(.body)
        .lineLimit(nil)
}
```

✅ **アクセシビリティサイズでのテスト**
```swift
#Preview("Accessibility Size") {
    TaskListView()
        .environment(\.dynamicTypeSize, .accessibility3)
        // プレビューでアクセシビリティサイズを確認
}
```

✅ **ViewThatFitsで自動レイアウト調整**
```swift
ViewThatFits {
    // 複数のレイアウトオプションを用意
    compactLayout
    expandedLayout
}
```

**DON'T（非推奨）**:

❌ **固定フォントサイズの使用**
```swift
Text("タイトル")
    .font(.system(size: 28)) // ❌ Dynamic Type非対応
```

❌ **lineLimit(1)で重要な情報を切り捨て**
```swift
Text("重要なタスクの説明文")
    .font(.body)
    .lineLimit(1) // ❌ アクセシビリティサイズで読めなくなる
```

❌ **固定の高さ制約**
```swift
Text("長いテキスト")
    .frame(height: 50) // ❌ Dynamic Typeで切り取られる可能性
```

❌ **アクセシビリティサイズでのレイアウト未検証**
```swift
// ❌ アクセシビリティサイズでテストしていない
HStack {
    Text("非常に長いタスク名が入る可能性があります")
    Spacer()
    Text("期限情報")
}
// → アクセシビリティサイズで重なる可能性
```

#### アクセシビリティ検証手順

**手順1: シミュレーターでの動作確認**

1. **シミュレーターを起動**
   ```bash
   open -a Simulator
   ```

2. **設定を開く**
   - Settings → Accessibility → Display & Text Size → Larger Text

3. **フォントサイズを変更**
   - スライダーを動かして各サイズ（特にAX1〜AX5）で確認

4. **アプリを起動して全画面を確認**
   - テキストが切り取られていないか
   - レイアウトが破綻していないか
   - ボタンがタップ可能か

**手順2: プレビューでの確認**

```swift
#Preview("Dynamic Type Sizes") {
    VStack(spacing: 20) {
        TaskRowView(task: Task.sample)
            .environment(\.dynamicTypeSize, .medium)

        TaskRowView(task: Task.sample)
            .environment(\.dynamicTypeSize, .xxxLarge)

        TaskRowView(task: Task.sample)
            .environment(\.dynamicTypeSize, .accessibility3)
    }
    .padding()
}
```

**手順3: 自動テスト**

```swift
import XCTest
@testable import kajilis

final class DynamicTypeTests: XCTestCase {
    func testTaskRowViewWithAccessibilitySize() {
        let task = Task.sample
        let view = TaskRowView(task: task)
            .environment(\.dynamicTypeSize, .accessibility5)

        // レイアウトが破綻していないことを確認
        // スナップショットテストなどで検証
    }
}
```

#### 実装チェックリスト

Dynamic Typeとアクセシビリティ対応を実装する際のチェックリストです。

- [ ] すべてのテキストでシステムテキストスタイル（`.font(.body)`など）を使用
- [ ] カスタムフォントの場合は`relativeTo`パラメータでDynamic Typeをサポート
- [ ] 重要な情報を持つテキストで`.lineLimit()`を使用していない（または`nil`を設定）
- [ ] アクセシビリティサイズ（AX1〜AX5）で全画面をテスト
- [ ] 水平レイアウトが破綻する場合は`ViewThatFits`または条件分岐で垂直レイアウトに切り替え
- [ ] 日本語テキストに適切な`.lineSpacing()`を設定
- [ ] プレビューで複数のDynamic Typeサイズを確認
- [ ] 固定の`frame(height:)`制約を使用していない（または最小限に制限）
- [ ] タブバーやツールバーなど、スペースが限られる要素のみ`.dynamicTypeSize()`で最大サイズを制限

#### まとめ

Dynamic TypeとアクセシビリティサポートはKajilisの重要な設計原則です。すべてのテキスト要素でDynamic Typeを考慮し、アクセシビリティサイズでも快適に利用できるレイアウトを実現します。

**次のステップ**:
- スペーシングシステムの定義
- コンポーネントライブラリでのDynamic Type対応

### SwiftUI実装ガイド

このセクションでは、Kajilisタイポグラフィシステムを実際のSwiftUIプロジェクトに実装する手順を説明します。

#### ステップ1: 基本的なテキストスタイルの使用

SwiftUIでは、`.font()`修飾子を使ってテキストスタイルを適用します。

**基本的な使用例**:
```swift
import SwiftUI

struct TaskListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Large Title: 画面タイトル
            Text("タスク管理")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Title 2: セクションタイトル
            Text("今日のタスク")
                .font(.title2)

            // Body: 説明文
            Text("今日中に完了すべきタスクが3件あります。")
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
```

#### ステップ2: タスクリストアイテムでの階層表現

リストアイテムでは、複数のテキストスタイルを組み合わせて情報の階層を表現します。

**実装例**:
```swift
struct TaskRowView: View {
    let task: Task

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Headline: タスク名（メインテキスト）
            Text(task.name)
                .font(.headline)

            // Subheadline: タスク詳細（サブテキスト）
            if let detail = task.detail {
                Text(detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            // Caption: メタ情報
            HStack(spacing: 8) {
                if let dueDate = task.dueDate {
                    Label(dueDate.formatted(date: .abbreviated, time: .omitted),
                          systemImage: "calendar")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                if task.isDueSoon {
                    Text("期限接近")
                        .font(.caption)
                        .foregroundStyle(.warningColor)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(.warningColor.opacity(0.1))
                        .cornerRadius(4)
                }
            }
        }
        .padding()
        .background(.backgroundSecondary)
        .cornerRadius(12)
    }
}
```

#### ステップ3: フォントウェイトの調整

`.fontWeight()`修飾子で強調度を調整できます。

**ウェイトの使い分け**:
```swift
VStack(alignment: .leading, spacing: 8) {
    // Regular (デフォルト)
    Text("通常のテキスト")
        .font(.body)

    // Semibold: 重要な情報
    Text("重要なお知らせ")
        .font(.body)
        .fontWeight(.semibold)

    // Bold: 非常に重要な情報
    Text("必須項目")
        .font(.body)
        .fontWeight(.bold)
}
```

**使用可能なフォントウェイト**:
- `.ultraLight` (100)
- `.thin` (200)
- `.light` (300)
- `.regular` (400) - デフォルト
- `.medium` (500)
- `.semibold` (600) - 推奨: 強調表示
- `.bold` (700) - 推奨: 非常に重要な情報
- `.heavy` (800)
- `.black` (900)

#### ステップ4: 日本語テキストの最適化

日本語テキストでは、行間やテキスト配置を調整します。

**日本語テキストの推奨設定**:
```swift
struct DescriptionView: View {
    let description: String

    var body: some View {
        Text(description)
            .font(.body)
            .lineSpacing(4)                    // 日本語用の行間
            .multilineTextAlignment(.leading)  // 左揃え
            .lineLimit(nil)                    // 折り返し無制限
    }
}

// 使用例
DescriptionView(description: """
    家族みんなで使えるタスク管理アプリです。
    買い物リストや献立を共有できます。
    """)
```

**長い見出しの場合**:
```swift
Text("タスク管理アプリケーション")
    .font(.largeTitle)
    .fontWeight(.bold)
    .kerning(1.5)                     // 文字間を広げる
    .multilineTextAlignment(.center)  // 中央揃え
```

#### ステップ5: Dynamic Type対応の実装

SwiftUIの標準テキストスタイルは自動的にDynamic Typeに対応します。

**基本的な実装**:
```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            // ✅ Dynamic Type自動対応
            Text("タスク一覧")
                .font(.largeTitle)

            Text("家族みんなで共有できるタスク管理アプリです。")
                .font(.body)
        }
    }
}
```

**アクセシビリティサイズへの対応**:
```swift
struct TaskRowView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let task: Task

    var body: some View {
        Group {
            if dynamicTypeSize >= .accessibility1 {
                // アクセシビリティサイズでは垂直レイアウト
                VStack(alignment: .leading, spacing: 8) {
                    titleView
                    detailView
                }
            } else {
                // 標準サイズでは水平レイアウト
                HStack {
                    titleView
                    Spacer()
                    detailView
                }
            }
        }
        .padding()
    }

    var titleView: some View {
        Text(task.name)
            .font(.headline)
    }

    var detailView: some View {
        Text(task.detail ?? "")
            .font(.subheadline)
            .foregroundStyle(.secondary)
    }
}
```

#### ステップ6: カスタムフォントでのDynamic Type対応

カスタムフォント（例: ヒラギノ角ゴシック Pro W6）を使用する場合も、`relativeTo`パラメータでDynamic Typeをサポートできます。

**実装例**:
```swift
// カスタムフォントでDynamic Typeをサポート
Text("タスク名")
    .font(.custom("HiraKakuProN-W6", size: 17, relativeTo: .body))
    // relativeTo: .body を指定することで、bodyスタイルのスケーリングに追従

// 見出しの場合
Text("セクションタイトル")
    .font(.custom("HiraKakuProN-W6", size: 22, relativeTo: .title2))
```

#### ステップ7: テキストスタイルの拡張を作成（オプション）

プロジェクト固有のテキストスタイルを定義する場合、`Font`の拡張を作成できます。

**Font+Extensions.swift**:
```swift
//
//  Font+Extensions.swift
//  kajilis
//
//  Kajilisデザインシステムのタイポグラフィ拡張
//

import SwiftUI

extension Font {
    // MARK: - カスタムスタイル

    /// タスクカードのタイトルスタイル
    static var taskCardTitle: Font {
        .headline
    }

    /// タスクカードの詳細スタイル
    static var taskCardDetail: Font {
        .subheadline
    }

    /// バッジのラベルスタイル
    static var badgeLabel: Font {
        .caption
    }

    /// エラーメッセージスタイル
    static var errorMessage: Font {
        .callout
    }
}

// 使用例
struct TaskCardView: View {
    let task: Task

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(task.name)
                .font(.taskCardTitle)

            if let detail = task.detail {
                Text(detail)
                    .font(.taskCardDetail)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
```

#### ステップ8: SwiftUIプレビューでの確認

SwiftUIプレビューで複数のテキストスタイルを確認できます。

**プレビュー例**:
```swift
#Preview("Typography Styles") {
    ScrollView {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                Text("Large Title")
                    .font(.largeTitle)
                Text("Title")
                    .font(.title)
                Text("Title 2")
                    .font(.title2)
                Text("Title 3")
                    .font(.title3)
                Text("Headline")
                    .font(.headline)
            }

            Divider()

            Group {
                Text("Body")
                    .font(.body)
                Text("Callout")
                    .font(.callout)
                Text("Subheadline")
                    .font(.subheadline)
                Text("Footnote")
                    .font(.footnote)
                Text("Caption")
                    .font(.caption)
            }
        }
        .padding()
    }
}

#Preview("Dynamic Type - Medium") {
    TaskRowView(task: Task.sample)
        .environment(\.dynamicTypeSize, .medium)
}

#Preview("Dynamic Type - Accessibility 3") {
    TaskRowView(task: Task.sample)
        .environment(\.dynamicTypeSize, .accessibility3)
}
```

#### ステップ9: 実装のベストプラクティス

**推奨パターン**:

✅ **システムスタイルを優先**
```swift
Text("タスク一覧")
    .font(.largeTitle)  // ✅ システム標準
```

✅ **意味的に正しいスタイルを選択**
```swift
VStack(alignment: .leading) {
    Text("タスク名")
        .font(.headline)      // ✅ メインテキスト
    Text("詳細説明")
        .font(.subheadline)   // ✅ セカンダリ情報
    Text("作成日時")
        .font(.caption)       // ✅ メタ情報
}
```

✅ **日本語テキストに行間を設定**
```swift
Text("家族みんなで使えるタスク管理アプリです。")
    .font(.body)
    .lineSpacing(4)  // ✅ 日本語用の行間
```

✅ **Dynamic Typeを考慮したレイアウト**
```swift
@Environment(\.dynamicTypeSize) var dynamicTypeSize

var body: some View {
    if dynamicTypeSize >= .accessibility1 {
        VStack { /* 垂直レイアウト */ }
    } else {
        HStack { /* 水平レイアウト */ }
    }
}
```

**避けるべきパターン**:

❌ **固定フォントサイズの使用**
```swift
Text("タイトル")
    .font(.system(size: 28))  // ❌ Dynamic Type非対応
```

❌ **カスタムフォントでrelativeToを省略**
```swift
Text("タイトル")
    .font(.custom("HiraKakuProN-W6", size: 22))  // ❌ Dynamic Type非対応
```

❌ **重要な情報でlineLimit(1)を使用**
```swift
Text("タスクの重要な説明文")
    .font(.body)
    .lineLimit(1)  // ❌ アクセシビリティサイズで読めなくなる
```

#### 実装チェックリスト

タイポグラフィ実装を完了する際のチェックリストです。

- [ ] すべてのテキストでSwiftUIのシステムスタイル（`.font(.body)`など）を使用
- [ ] カスタムフォントを使用する場合は`relativeTo`パラメータを指定
- [ ] 日本語テキストに`.lineSpacing(4)`を設定
- [ ] 階層構造を明確にするため、適切なテキストスタイルを選択
- [ ] アクセシビリティサイズで全画面をテスト
- [ ] SwiftUIプレビューで複数のDynamic Typeサイズを確認
- [ ] 重要な情報を持つテキストで`.lineLimit()`を使用していない
- [ ] Font拡張を作成する場合、内部でシステムスタイルを返すように実装

#### まとめ

SwiftUIのタイポグラフィシステムは、システム標準のテキストスタイルを使用することで、Dynamic Typeに自動的に対応します。Kajilisでは、これらの標準スタイルを活用し、日本語テキストに適した調整を加えることで、すべてのユーザーにとって読みやすいUIを実現します。

**次のステップ**:
- スペーシングシステムの実装
- コンポーネントライブラリでのタイポグラフィ適用
- 実際の画面実装でのタイポグラフィテスト

---

## スペーシングシステム

Kajilisのスペーシングシステムは、8ptグリッドベースの一貫したスケールを採用し、視覚的にバランスの取れたレイアウトを実現します。すべてのスペーシング値は予測可能で、コンポーネント間の余白、パディング、マージンに統一的に適用されます。

### スペーシングスケール

8ptグリッドシステムをベースに、9段階のスペーシングスケールを定義します。

#### スペーシング値一覧

| トークン名 | 値 (pt) | 用途 |
|----------|---------|------|
| `xxxs` | 2pt | 極小の間隔、アイコンとテキストの微調整 |
| `xxs` | 4pt | 非常に小さな間隔、密集したUI要素 |
| `xs` | 8pt | 小さな間隔、コンパクトなレイアウト |
| `s` | 12pt | やや小さめの間隔、関連要素のグルーピング |
| `m` | 16pt | 標準的な間隔、一般的なコンポーネント間 |
| `l` | 24pt | 大きめの間隔、セクション内の区切り |
| `xl` | 32pt | 非常に大きな間隔、セクション間の区切り |
| `xxl` | 48pt | 極大の間隔、画面レベルのセパレーション |
| `xxxl` | 64pt | 最大の間隔、特別な分離が必要な場合 |

### スペーシングの使い分けガイドライン

#### 要素内のスペーシング（パディング）

コンポーネント内部の余白に使用します。

**推奨値**:
- **xxs (4pt)**: バッジ、小さなチップの内部余白
- **xs (8pt)**: ボタンの上下余白、小さなカードの余白
- **s (12pt)**: ボタンの左右余白、入力フィールドの余白
- **m (16pt)**: カードの標準的な余白、リストアイテムの余白
- **l (24pt)**: 大きなカードやモーダルの余白

**使用例**:
```swift
// ボタンのパディング
Button("タスクを追加") {
    // アクション
}
.padding(.horizontal, 12) // s: 左右の余白
.padding(.vertical, 8)    // xs: 上下の余白

// カードのパディング
VStack(alignment: .leading, spacing: 8) {
    Text("タスク名")
    Text("詳細説明")
}
.padding(16) // m: カード全体の余白
.background(.backgroundSecondary)
.cornerRadius(12)
```

#### 要素間のスペーシング（マージン）

コンポーネント間の間隔に使用します。

**推奨値**:
- **xxs (4pt)**: 同じグループ内の密接な要素（例: テキストと補足情報）
- **xs (8pt)**: 関連する要素のグルーピング（例: ラベルと入力フィールド）
- **s (12pt)**: 同じセクション内の要素（例: フォーム項目間）
- **m (16pt)**: 一般的なコンポーネント間の標準的な間隔
- **l (24pt)**: セクション内の大きな区切り
- **xl (32pt)**: セクション間の区切り
- **xxl (48pt)**: 画面の主要な領域間の分離

**使用例**:
```swift
// VStackでの要素間スペーシング
VStack(spacing: 16) { // m: 標準的なコンポーネント間
    TaskRowView(task: task1)
    TaskRowView(task: task2)
    TaskRowView(task: task3)
}

// 異なるスペーシングの組み合わせ
VStack(spacing: 0) {
    // タイトルセクション
    VStack(alignment: .leading, spacing: 4) { // xxs: 密接な要素
        Text("タスク一覧")
            .font(.largeTitle)
        Text("今日のタスク")
            .font(.subheadline)
            .foregroundStyle(.secondary)
    }
    .padding(.bottom, 24) // l: セクション区切り

    // タスクリスト
    VStack(spacing: 12) { // s: リストアイテム間
        ForEach(tasks) { task in
            TaskRowView(task: task)
        }
    }
}
.padding(16) // m: 画面全体の余白
```

### レイアウトパターン別のスペーシング推奨値

#### リスト画面

```swift
ScrollView {
    VStack(spacing: 16) { // m: リストアイテム間
        ForEach(tasks) { task in
            VStack(alignment: .leading, spacing: 4) { // xxs: カード内の密接な要素
                Text(task.name)
                    .font(.headline)
                Text(task.detail ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(16) // m: カード内部の余白
            .background(.backgroundSecondary)
            .cornerRadius(12)
        }
    }
    .padding(16) // m: 画面全体の余白
}
```

#### フォーム画面

```swift
Form {
    Section {
        VStack(alignment: .leading, spacing: 8) { // xs: ラベルと入力フィールド
            Text("タスク名")
                .font(.subheadline)
            TextField("タスク名を入力", text: $taskName)
                .textFieldStyle(.roundedBorder)
        }

        VStack(alignment: .leading, spacing: 8) { // xs: ラベルと入力フィールド
            Text("期日")
                .font(.subheadline)
            DatePicker("", selection: $dueDate, displayedComponents: .date)
                .labelsHidden()
        }
    }
    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
    // s (12pt) 上下、m (16pt) 左右
}
```

#### カードグリッド

```swift
LazyVGrid(columns: [
    GridItem(.flexible(), spacing: 16), // m: 列間
    GridItem(.flexible(), spacing: 16)
], spacing: 16) { // m: 行間
    ForEach(items) { item in
        CardView(item: item)
    }
}
.padding(16) // m: グリッド全体の余白
```

#### 詳細画面

```swift
ScrollView {
    VStack(spacing: 24) { // l: セクション間
        // ヘッダーセクション
        VStack(alignment: .leading, spacing: 8) { // xs: 関連情報
            Text(task.name)
                .font(.largeTitle)
            Text(task.category)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }

        Divider()

        // 詳細セクション
        VStack(alignment: .leading, spacing: 12) { // s: フォーム項目
            DetailRow(label: "期日", value: task.dueDate)
            DetailRow(label: "担当者", value: task.assignee)
            DetailRow(label: "ステータス", value: task.status)
        }

        Divider()

        // 説明セクション
        VStack(alignment: .leading, spacing: 8) { // xs: タイトルと本文
            Text("詳細")
                .font(.headline)
            Text(task.description)
                .font(.body)
        }
    }
    .padding(16) // m: 画面全体の余白
}
```

### 8ptグリッドシステムの原則

#### 基本ルール

1. **すべてのスペーシングは8の倍数**: xs (8pt), m (16pt), l (24pt), xl (32pt)
2. **例外として4の倍数も許可**: xxxs (2pt), xxs (4pt), s (12pt)
3. **一貫性を保つ**: 同じ種類の要素には同じスペーシングを適用

#### グリッドアライメント

```swift
// ✅ DO: 8ptグリッドに沿った配置
VStack(spacing: 16) {  // 16pt = 8 × 2
    Text("タイトル")
        .padding(8)    // 8pt = 8 × 1
}

// ❌ DON'T: ランダムな値
VStack(spacing: 15) {  // ❌ 8の倍数ではない
    Text("タイトル")
        .padding(7)    // ❌ 8の倍数ではない
}
```

### コンポーネント別の推奨スペーシング

#### ボタン

```swift
// プライマリボタン
Button("保存") { }
    .padding(.horizontal, 16) // m
    .padding(.vertical, 12)   // s
    .background(.primaryColor)
    .cornerRadius(8)

// アイコン付きボタン
Button {
    // アクション
} label: {
    HStack(spacing: 8) { // xs: アイコンとテキスト間
        Image(systemName: "plus")
        Text("追加")
    }
    .padding(.horizontal, 16) // m
    .padding(.vertical, 12)   // s
}
```

#### カード

```swift
VStack(alignment: .leading, spacing: 12) { // s: カード内要素間
    Text("タスク名")
        .font(.headline)
    Text("詳細説明")
        .font(.body)
    HStack(spacing: 8) { // xs: メタ情報間
        Label("期日", systemImage: "calendar")
        Label("担当者", systemImage: "person")
    }
    .font(.caption)
}
.padding(16) // m: カード内部の余白
.background(.backgroundSecondary)
.cornerRadius(12)
```

#### リストアイテム

```swift
HStack(spacing: 12) { // s: アイコンとコンテンツ間
    Image(systemName: "circle")
        .foregroundStyle(.primaryColor)

    VStack(alignment: .leading, spacing: 4) { // xxs: タイトルとサブタイトル
        Text("タスク名")
            .font(.headline)
        Text("詳細説明")
            .font(.subheadline)
            .foregroundStyle(.secondary)
    }

    Spacer()

    Image(systemName: "chevron.right")
        .foregroundStyle(.secondary)
}
.padding(.horizontal, 16) // m: 左右の余白
.padding(.vertical, 12)   // s: 上下の余白
```

#### 入力フィールド

```swift
VStack(alignment: .leading, spacing: 8) { // xs: ラベルと入力
    Text("タスク名")
        .font(.subheadline)

    TextField("入力してください", text: $text)
        .padding(12) // s: 入力フィールド内部の余白
        .background(.backgroundTertiary)
        .cornerRadius(8)
}
```

### ベストプラクティス

#### DO（推奨）

✅ **8ptグリッドに従う**
```swift
VStack(spacing: 16) { // ✅ 8の倍数
    Text("タイトル")
}
.padding(24) // ✅ 8の倍数
```

✅ **一貫したスペーシングを使用**
```swift
// すべてのカードで同じスペーシング
ForEach(items) { item in
    CardView(item: item)
        .padding(16) // ✅ 全カードで統一
}
```

✅ **コンテキストに応じた適切な値を選択**
```swift
VStack(spacing: 4) {  // xxs: 密接な関係
    Text("タイトル").font(.headline)
    Text("サブタイトル").font(.subheadline)
}

Spacer().frame(height: 24) // l: セクション区切り

VStack(spacing: 12) { // s: 通常のリスト
    ListItem1()
    ListItem2()
}
```

#### DON'T（非推奨）

❌ **ランダムな値を使用**
```swift
VStack(spacing: 13) { // ❌ グリッドに沿っていない
    Text("タイトル")
}
.padding(17) // ❌ 予測不可能
```

❌ **過度に大きなスペーシング**
```swift
VStack(spacing: 64) { // ❌ xxxlは特別な場合のみ
    Text("タイトル")
    Text("本文")
}
```

❌ **過度に小さなスペーシング**
```swift
HStack(spacing: 2) { // ❌ xxxsは微調整のみに使用
    Text("ボタン1")
    Text("ボタン2")
}
```

### まとめ

Kajilisのスペーシングシステムは、8ptグリッドベースの9段階スケール（xxxs〜xxxl）を採用し、視覚的に調和の取れたレイアウトを実現します。

**スペーシング選択の基本方針**:
1. **関連要素のグルーピング**: xxs (4pt), xs (8pt)
2. **標準的なコンポーネント間**: s (12pt), m (16pt)
3. **セクション区切り**: l (24pt), xl (32pt)
4. **特別な分離**: xxl (48pt), xxxl (64pt)

**次のステップ**:
- SwiftUIスペーシング実装ガイドの作成（タスク4.2）
- コンポーネントライブラリでのスペーシング適用
- 実際の画面実装でのスペーシングテスト

---

## コンポーネントライブラリ

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

---

## レイアウトパターン

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

---

## アイコンシステム

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

---

## アニメーション

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

---

## アクセシビリティ

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

---

## コーディング規約

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

---

## バージョン履歴

### v1.0.0 (2025-11-07)

**初版リリース**

- ドキュメント構造の初期化
- 目次と概要セクションの作成
- デザイン原則の定義
- 10個のメインセクションのプレースホルダー作成

**変更の概要**:
- Kajilis iOSデザインシステムの基盤となるドキュメントを作成
- AIエージェントおよび開発者が参照可能な構造を確立
- 今後のセクション追加のための土台を整備

**次のステップ**:
- カラーシステムの定義（v1.1.0予定）
- タイポグラフィシステムの定義（v1.2.0予定）
- その他セクションの順次追加

---

### バージョン番号の規則

本デザインシステムは、セマンティックバージョニングに従います:

- **メジャーバージョン（X.0.0）**: 破壊的変更（既存コンポーネント仕様の根本的な変更）
- **マイナーバージョン（0.X.0）**: 後方互換性のある追加（新コンポーネント追加、セクション追加）
- **パッチバージョン（0.0.X）**: 軽微な修正（誤字修正、コード例の改善、補足説明の追加）

### 更新ガイドライン

ドキュメントを更新する際は、以下の手順に従ってください:

1. 変更内容を実施
2. バージョン番号を適切に更新
3. バージョン履歴セクションに変更内容を記録
4. 最終更新日を更新
5. 関連するコード例やビジュアルを更新

---

## ドキュメントの使用方法

### AIエージェント向け

本ドキュメントは、AIエージェントがSwiftUIコンポーネントを実装する際の参照ガイドとして設計されています:

1. **実装前**: 関連セクションを読み、デザイントークンとパターンを確認
2. **実装中**: コード例を参照し、推奨されるSwiftUIの書き方に従う
3. **実装後**: ベストプラクティスとアクセシビリティガイドラインを確認

### 開発者向け

新しい画面やコンポーネントを実装する際:

1. **設計フェーズ**: レイアウトパターンを参照し、適切なパターンを選択
2. **コーディングフェーズ**: デザイントークン（カラー、タイポグラフィ、スペーシング）を使用
3. **レビューフェーズ**: アクセシビリティとコーディング規約を確認

### デザイナー向け

UIデザインを作成する際:

1. デザイン原則に沿ったデザインを作成
2. デザイントークン（カラー、タイポグラフィ、スペーシング）を使用
3. 既存のコンポーネントライブラリを優先的に活用

---

## サポートとフィードバック

### 質問や提案

デザインシステムに関する質問や改善提案は、プロジェクトのGitHubリポジトリのIssueとして報告してください。

### ドキュメントの改善

誤字、不明瞭な説明、不足している情報を見つけた場合は、Pull Requestを作成して修正にご協力ください。

---

**© 2025 Kajilis Project. All rights reserved.**
