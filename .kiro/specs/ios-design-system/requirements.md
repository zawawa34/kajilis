# Requirements Document

## Introduction

KajilisiOSアプリケーションにおいて、AIエージェント（Claude Codeなど）が実装を行う際にデザインの一貫性を維持できるよう、包括的なデザインシステムを定義します。本デザインシステムは、SwiftUIコンポーネント、カラーパレット、タイポグラフィ、スペーシング、レイアウトパターン、アニメーション、アクセシビリティガイドラインを標準化し、ドキュメント化することで、開発効率とユーザー体験の品質を向上させます。

## Requirements

### Requirement 1: カラーシステムの定義
**Objective:** AIエージェントとして、統一されたカラーパレットを参照できるようにしたい。それにより、アプリ全体で一貫したビジュアルアイデンティティを実現できる。

#### Acceptance Criteria

1. WHEN デザインシステムドキュメントが作成される THEN カラーシステム SHALL プライマリカラー、セカンダリカラー、アクセントカラーを定義する
2. WHEN カラーシステムが定義される THEN カラーシステム SHALL ライトモードとダークモードの両方に対応したカラー値を含む
3. WHEN 意味論的カラーが定義される THEN デザインシステム SHALL success、warning、error、infoの状態カラーを含む
4. WHEN 背景色が定義される THEN デザインシステム SHALL primary、secondary、tertiaryの背景レイヤーを定義する
5. WHERE SwiftUIでカラーを実装する THE デザインシステム SHALL `Assets.xcassets`のColor Setとして定義する方法を明記する
6. WHEN カラー名が定義される THEN カラー名 SHALL セマンティックな命名規則（用途ベース）に従う

### Requirement 2: タイポグラフィシステムの定義
**Objective:** AIエージェントとして、統一されたタイポグラフィスタイルを適用できるようにしたい。それにより、テキストの階層構造が明確で読みやすいUIを構築できる。

#### Acceptance Criteria

1. WHEN タイポグラフィシステムが定義される THEN システム SHALL largeTitle、title、title2、title3、headline、body、callout、subheadline、footnote、captionのテキストスタイルを含む
2. WHEN 各テキストスタイルが定義される THEN 定義 SHALL フォントファミリー、フォントサイズ、フォントウェイト、行間、文字間を明記する
3. WHERE Dynamic Typeをサポートする THE デザインシステム SHALL アクセシビリティサイズへの対応方法を含む
4. WHEN 日本語テキストが表示される THEN タイポグラフィ SHALL 日本語フォントの推奨設定を含む
5. WHERE SwiftUIでタイポグラフィを実装する THE デザインシステム SHALL `.font()` modifierの使用例を提供する

### Requirement 3: スペーシングシステムの定義
**Objective:** AIエージェントとして、一貫したスペーシング値を使用できるようにしたい。それにより、視覚的にバランスの取れたレイアウトを実現できる。

#### Acceptance Criteria

1. WHEN スペーシングシステムが定義される THEN システム SHALL 4ptまたは8ptグリッドベースのスケールを採用する
2. WHEN スペーシング値が定義される THEN 定義 SHALL xxxs、xxs、xs、s、m、l、xl、xxl、xxxlのサイズバリエーションを含む
3. WHEN 各スペーシング値が定義される THEN 値 SHALL 具体的なポイント数（例: s=8pt, m=16pt, l=24pt）を明記する
4. WHERE SwiftUIでスペーシングを実装する THE デザインシステム SHALL `.padding()` と `.spacing()` の使用例を提供する
5. WHEN コンポーネント間の余白が必要な場合 THEN ガイドライン SHALL 推奨されるスペーシング値を示す

### Requirement 4: コンポーネントライブラリの定義
**Objective:** AIエージェントとして、再利用可能なUIコンポーネントの仕様を参照できるようにしたい。それにより、コンポーネントの重複実装を避け、実装速度を向上できる。

#### Acceptance Criteria

1. WHEN コンポーネントライブラリが定義される THEN ライブラリ SHALL ボタン、カード、リストアイテム、入力フィールド、モーダル、アラート、ナビゲーションバーの基本コンポーネントを含む
2. WHEN 各コンポーネントが定義される THEN 定義 SHALL コンポーネントの用途、プロパティ、バリエーション、使用例を含む
3. WHERE ボタンコンポーネントが定義される THE 定義 SHALL primary、secondary、tertiary、destructiveのスタイルバリエーションを含む
4. WHEN コンポーネントの状態が定義される THEN 定義 SHALL default、hover、pressed、disabled、loadingの状態を明記する
5. WHERE SwiftUIでコンポーネントを実装する THE デザインシステム SHALL コード例とベストプラクティスを提供する
6. WHEN コンポーネント名が定義される THEN 命名 SHALL PascalCase（例: PrimaryButton、TaskCard）に従う

### Requirement 5: レイアウトパターンの定義
**Objective:** AIエージェントとして、一般的な画面レイアウトのパターンを参照できるようにしたい。それにより、ユーザビリティの高い画面構成を迅速に実装できる。

#### Acceptance Criteria

1. WHEN レイアウトパターンが定義される THEN パターン SHALL リスト画面、詳細画面、フォーム画面、タブ画面、モーダル画面の基本パターンを含む
2. WHEN 各レイアウトパターンが定義される THEN 定義 SHALL 画面構成、ナビゲーション、主要コンポーネントの配置を明記する
3. WHERE 安全領域が関与する THE ガイドライン SHALL `.safeAreaInset()` と `.ignoresSafeArea()` の使用方針を含む
4. WHEN 画面サイズが変化する THEN レイアウト SHALL iPhone SEからiPhone Pro Maxまでの対応方法を示す
5. WHERE スクロール可能なコンテンツがある THE ガイドライン SHALL `ScrollView`、`List`、`LazyVStack`の使い分け基準を提供する

### Requirement 6: アイコンシステムの定義
**Objective:** AIエージェントとして、統一されたアイコンの使用方法を理解できるようにしたい。それにより、視覚的に一貫性のあるアイコン使用を実現できる。

#### Acceptance Criteria

1. WHEN アイコンシステムが定義される THEN システム SHALL SF Symbolsを優先的に使用する方針を明記する
2. WHEN カスタムアイコンが必要な場合 THEN ガイドライン SHALL `Assets.xcassets`でのSVG管理方法を含む
3. WHEN アイコンサイズが定義される THEN 定義 SHALL small (16pt)、medium (24pt)、large (32pt) のサイズバリエーションを含む
4. WHERE アイコンに色を適用する THE ガイドライン SHALL `.foregroundStyle()` の使用方法を示す
5. WHEN アイコンがボタン内で使用される THEN ガイドライン SHALL アイコンとテキストのスペーシング基準を提供する

### Requirement 7: アニメーション・トランジションの定義
**Objective:** AIエージェントとして、一貫したアニメーションパターンを適用できるようにしたい。それにより、スムーズで直感的なユーザー体験を提供できる。

#### Acceptance Criteria

1. WHEN アニメーションが定義される THEN システム SHALL デフォルトのアニメーション時間（例: 0.3秒）を明記する
2. WHEN イージング関数が定義される THEN 定義 SHALL `.easeInOut`、`.easeIn`、`.easeOut`、`.spring()` の使い分け基準を含む
3. WHERE 画面遷移がある THE ガイドライン SHALL `.transition()` の推奨パターンを提供する
4. WHEN 状態変化にアニメーションを適用する THEN ガイドライン SHALL `.animation()` modifier の使用例を含む
5. WHERE ユーザーアクションにフィードバックを与える THE システム SHALL タップ時のスケール変化（例: 0.95倍）などの標準的なインタラクションを定義する

### Requirement 8: アクセシビリティガイドラインの定義
**Objective:** AIエージェントとして、アクセシブルなUIを実装できるようにしたい。それにより、すべてのユーザーにとって使いやすいアプリを実現できる。

#### Acceptance Criteria

1. WHEN アクセシビリティガイドラインが定義される THEN ガイドライン SHALL VoiceOver対応の基本方針を含む
2. WHEN インタラクティブ要素が実装される THEN 要素 SHALL 適切な `.accessibilityLabel()` を持つ
3. WHERE カラーコントラストが関与する THE ガイドライン SHALL WCAG AA基準（4.5:1以上）の達成方法を示す
4. WHEN Dynamic Typeがサポートされる THEN コンポーネント SHALL `.dynamicTypeSize()` での制約方法を含む
5. WHERE タッチターゲットが定義される THE ガイドライン SHALL 最小タップ領域44x44ptの確保方法を明記する

### Requirement 9: 命名規則とファイル構成の定義
**Objective:** AIエージェントとして、一貫した命名規則とファイル構成を適用できるようにしたい。それにより、コードの可読性と保守性を向上できる。

#### Acceptance Criteria

1. WHEN Swiftファイルの命名規則が定義される THEN 規則 SHALL View、ViewModel、Model、Serviceの接尾辞ルールを含む
2. WHEN ディレクトリ構成が定義される THEN 構成 SHALL Views/、ViewModels/、Models/、Services/、Components/、Utilities/の推奨構造を含む
3. WHERE 再利用可能なコンポーネントがある THE ガイドライン SHALL `Components/` ディレクトリ配下での整理方法を示す
4. WHEN プレビュー用のコードが作成される THEN コード SHALL `#Preview` マクロの使用標準を含む
5. WHERE 環境設定ファイルがある THE ガイドライン SHALL `.xcconfig` ファイルの管理方法を明記する

### Requirement 10: ドキュメント形式とメンテナンス方針の定義
**Objective:** AIエージェントとして、デザインシステムドキュメントを効率的に参照・更新できるようにしたい。それにより、デザインシステムの継続的な改善が可能になる。

#### Acceptance Criteria

1. WHEN デザインシステムドキュメントが作成される THEN ドキュメント SHALL Markdown形式で記述される
2. WHEN ドキュメントが構成される THEN 構成 SHALL 目次、概要、各セクション、コード例、ビジュアル例を含む
3. WHERE コード例が提供される THE 例 SHALL 実際に動作するSwiftUIコードスニペットを含む
4. WHEN デザインシステムが更新される THEN ドキュメント SHALL バージョン番号と変更履歴を記録する
5. WHERE ビジュアルリファレンスが必要な場合 THE ドキュメント SHALL スクリーンショットまたは図解を含む
6. WHEN ドキュメントの保存場所が定義される THEN 場所 SHALL `.kiro/steering/` ディレクトリ配下の `ios-design.md` とする
