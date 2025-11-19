# Project Structure

## ルートディレクトリ構成

```
kajilis/
├── backend/           # Rails バックエンドアプリケーション
├── ios/               # iOS Swift アプリケーション
├── .claude/           # Claude Code設定（slash commands）
├── .kiro/             # Spec Driven Development ドキュメント
│   ├── steering/      # プロジェクト全体のステアリングドキュメント
│   └── specs/         # 機能ごとの仕様ドキュメント
├── .git/              # Gitリポジトリ
└── CLAUDE.md          # Claude Code プロジェクト指示書
```

## Backend (Rails) サブディレクトリ構造

### アプリケーションコア (`backend/app/`)
```
app/
├── assets/
│   └── stylesheets/      # CSS スタイルシート
├── controllers/          # コントローラー層
│   └── application_controller.rb
├── helpers/              # View ヘルパー
├── jobs/                 # Active Job バックグラウンドジョブ
├── mailers/              # Action Mailer メーラークラス
├── models/               # Active Record モデル層
│   └── application_record.rb
├── views/                # View テンプレート
│   ├── layouts/          # レイアウトテンプレート
│   └── pwa/              # PWA関連（manifest, service-worker）
└── javascript/           # JavaScript (Importmap + Stimulus)
    ├── application.js    # エントリーポイント
    └── controllers/      # Stimulus コントローラー
```

### 設定 (`backend/config/`)
```
config/
├── application.rb        # Rails アプリケーション設定
├── boot.rb               # Bootsnap キャッシング
├── database.yml          # データベース接続設定
├── routes.rb             # ルーティング定義
├── puma.rb               # Puma Webサーバー設定
├── storage.yml           # Active Storage 設定
├── master.key            # 認証情報暗号化キー（Git管理外）
├── credentials.yml.enc   # 暗号化された認証情報
├── environments/         # 環境別設定
│   ├── development.rb
│   └── test.rb
├── initializers/         # 初期化処理
└── locales/              # i18n 翻訳ファイル
```

### データベース (`backend/db/`)
```
db/
├── seeds.rb              # シードデータ
└── migrate/              # マイグレーションファイル（今後追加）
```

### パブリックアセット (`backend/public/`)
```
public/
├── 400.html, 404.html, 422.html, 500.html  # エラーページ
├── 406-unsupported-browser.html            # ブラウザ非対応ページ
├── icon.svg, icon.png                      # アプリアイコン
└── robots.txt                              # SEO クローラー設定
```

### 実行可能スクリプト (`backend/bin/`)
```
bin/
├── rails, rake           # Rails/Rake CLI
├── dev                   # 開発サーバー起動
├── setup                 # 初期セットアップスクリプト
├── ci                    # CI実行スクリプト
├── brakeman              # セキュリティスキャナー
├── bundler-audit         # 脆弱性チェッカー
├── rubocop               # コードスタイルチェッカー
├── thrust                # HTTP acceleration
└── docker-entrypoint     # Docker コンテナエントリーポイント
```

### その他
```
backend/
├── Gemfile, Gemfile.lock # Ruby gem依存関係
├── Rakefile              # Rake タスク定義
├── config.ru             # Rack設定
├── Dockerfile            # Docker イメージビルド定義
└── tmp/                  # 一時ファイル（キャッシュなど）
```

## iOS アプリケーション構造 (`ios/`)

```
ios/
├── kajilis.xcodeproj/                 # Xcodeプロジェクトファイル
├── kajilis/                           # メインアプリケーション
│   ├── kajilisApp.swift               # App エントリーポイント (.tint適用済み)
│   ├── ContentView.swift              # TabView構造のメインビュー
│   ├── Views/                         # 機能別ビューファイル
│   │   ├── Shopping/
│   │   │   └── ShoppingListView.swift   # 買い物リスト画面
│   │   ├── Menu/
│   │   │   └── MenuPlanView.swift       # 献立画面
│   │   ├── Tasks/
│   │   │   └── TaskListView.swift       # タスク画面
│   │   └── Settings/
│   │       └── SettingsView.swift       # 設定画面
│   └── Assets.xcassets/               # 画像・カラーアセット
│       ├── AccentColor.colorset/      # アクセントカラー定義 (#FF9500)
│       └── AppIcon.appiconset/        # アプリアイコン
├── kajilisTests/                      # ユニットテスト
│   └── kajilisTests.swift
├── kajilisUITests/                    # UIテスト
│   ├── kajilisUITests.swift
│   └── kajilisUITestsLaunchTests.swift
└── .gitignore                         # iOS用Git除外設定
```

## Spec Driven Development 構造 (`.kiro/`)

### ステアリングドキュメント (`steering/`)
プロジェクト全体のコンテキストと制約を定義：
- `product.md`: プロダクト概要とビジネス目標
- `tech.md`: 技術スタックとアーキテクチャ決定
- `structure.md`: ファイル構成とコードパターン（本ファイル）
- `design.md`: デザインシステムとUI実装ガイドライン

### 仕様ドキュメント (`specs/`)
機能ごとの詳細な仕様（今後追加）：
```
specs/
└── [feature-name]/
    ├── requirements.md    # 要件定義
    ├── design.md          # 技術設計
    └── tasks.md           # 実装タスク
```

## Claude Code 設定 (`.claude/`)

```
.claude/
└── commands/              # カスタムslash commands
    └── kiro:*.md          # Kiro SDD workflow commands
```

## コード編成パターン

### Rails アプリケーション層
1. **Models**: ビジネスロジックとデータ永続化
2. **Controllers**: HTTP リクエストハンドリング
3. **Views**: HTML/JSON レスポンス生成
4. **Jobs**: バックグラウンド処理（Solid Queue）
5. **Mailers**: メール送信ロジック

### Rails 命名規則
- **Models**: 単数形 PascalCase (`User`, `Post`)
- **Controllers**: 複数形 + Controller (`UsersController`, `PostsController`)
- **Files**: スネークケース (`user_controller.rb`, `posts_helper.rb`)

### Swift (iOS) 命名規則
- **Structs/Classes**: PascalCase (`ContentView`, `UserProfile`)
- **Variables/Functions**: camelCase (`userName`, `fetchData()`)
- **Files**: PascalCase matching type name (`ContentView.swift`)
- **Views**: 機能名 + View (`ShoppingListView`, `TaskListView`)
- **View Components**: 要素名 + Row/Card/Button等 (`TaskRow`, `MenuCard`)

## Import/依存関係の組織化

### Rails
```ruby
# Standard library
require "json"

# Gems (via Bundler.require in application.rb)
# 自動ロード - Gemfileで定義

# Application files
# 自動ロード - config.autoload_libで設定
```

### Swift
```swift
// System frameworks
import SwiftUI
import Foundation

// Third-party frameworks (CocoaPods/SPMで追加)

// Internal modules
// 自動インポート（同一モジュール内）
```

## 主要なアーキテクチャ原則

### 1. Hotwireファースト
- デフォルトでTurboを使用したSPA風ナビゲーション
- JavaScriptはStimulusコントローラーで最小限に

### 2. RESTful API設計
- Rails標準の resource routing
- JSON API は jbuilder でビルド

### 3. 関心の分離
- Fat Models, Skinny Controllers
- Business logicはモデル層に集約
- コントローラーはHTTPインターフェースのみ

### 4. セキュリティバイデフォルト
- CSP (Content Security Policy) 有効化
- Parameter filtering (config/initializers/filter_parameter_logging.rb)
- CI組み込み: Brakeman + Bundler Audit

### 5. テスト駆動開発 (TDD)
- テストファーストの開発アプローチ
- `bin/ci`で包括的なテスト実行

### 6. Docker Native Deployment
- Kamal による本番環境デプロイ
- Thruster によるHTTP acceleration

### 7. Database-Backed Infrastructure
- Solid Cache: Railsキャッシュ
- Solid Queue: Active Job
- Solid Cable: Action Cable (WebSocket)
- すべてSQLiteベース（シンプル構成）

### 8. iOS デザインシステム
- **Apple HIG準拠**: iOSユーザーにとって直感的なUI
- **SwiftUI標準コンポーネント**: 実装効率と保守性を重視
- **SF Symbols**: アイコンシステム（5,000以上のシンボル利用可能）
- **Semantic Colors**: ライト/ダークモード自動対応
- **アクセシビリティ**: ダイナミックタイプ、VoiceOver自動対応
