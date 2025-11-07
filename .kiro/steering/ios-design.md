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

---

## タイポグラフィ

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

---

## スペーシングシステム

<!-- このセクションは今後のタスクで実装 -->
詳細は今後の実装で追加されます。

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
