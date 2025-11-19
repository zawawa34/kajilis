# Technology Stack

## アーキテクチャ
- **Backend**: Monolithic Rails API
- **Frontend (iOS)**: SwiftUI-based native application
- **Frontend (Web)**: Hotwire (Turbo + Stimulus) with Importmap
- **Database**: SQLite3 (development/test), 複数データベース構成対応（production）
- **Deployment**: Docker + Kamal

## Frontend - iOS

### 言語・フレームワーク
- **Swift**: iOS native development
- **SwiftUI**: Declarative UI framework
- **Xcode**: Development IDE

### デザインシステム
- **ガイドライン**: Apple Human Interface Guidelines準拠
- **カラーシステム**: iOS Semantic Colors + カスタムアクセントカラー
  - AccentColor: #FF9500 (Light) / #FF9F0A (Dark)
- **アイコン**: SF Symbols完全利用
- **タイポグラフィ**: San Francisco (システムフォント)
- **UIコンポーネント**: SwiftUI標準コンポーネント中心

詳細は `.kiro/steering/design.md` を参照

### プロジェクト構成
- **App Entry**: `kajilisApp.swift` - メインアプリケーションエントリーポイント
- **Main View**: `ContentView.swift` - TabView構造のメインビュー
- **Views/**: 機能別ビューファイル
  - `Shopping/ShoppingListView.swift` - 買い物リスト画面
  - `Menu/MenuPlanView.swift` - 献立画面
  - `Tasks/TaskListView.swift` - タスク画面
  - `Settings/SettingsView.swift` - 設定画面
- **Assets.xcassets/**: カラーアセット、画像リソース
  - `AccentColor.colorset/` - アプリ全体のアクセントカラー定義

## Frontend - Web

### 言語・フレームワーク
- **Hotwire (Turbo Rails)**: SPA-like page acceleration
- **Stimulus**: JavaScript framework for sprinkles of behavior
- **Importmap**: ESM import maps (no bundler)
- **Propshaft**: Modern asset pipeline

### スタイリング
- Standard CSS via `app/assets/stylesheets/application.css`

## Backend

### 言語・フレームワーク
- **Ruby**: Version managed by bundler
- **Rails**: 8.1.1
- **Puma**: Web server (>= 5.0)

### データベース
- **Development/Test**: SQLite3 (>= 2.1)
- **Production**: Multi-database configuration
  - Primary: `production.sqlite3`
  - Cache: `production_cache.sqlite3` (Solid Cache)
  - Queue: `production_queue.sqlite3` (Solid Queue)
  - Cable: `production_cable.sqlite3` (Solid Cable)

### 主要なGem依存関係
- **turbo-rails**: Hotwire Turbo
- **stimulus-rails**: Hotwire Stimulus
- **jbuilder**: JSON API builder
- **solid_cache**: Database-backed Rails.cache
- **solid_queue**: Database-backed Active Job
- **solid_cable**: Database-backed Action Cable
- **image_processing**: Active Storage variants
- **kamal**: Docker deployment orchestration
- **thruster**: HTTP asset caching/compression for Puma

### セキュリティ・品質ツール
- **bundler-audit**: Security vulnerability scanning for gems
- **brakeman**: Static security analysis
- **rubocop-rails-omakase**: Ruby style linter (Rails Omakase preset)

## Development Environment

### 必須ツール
- **Ruby**: Bundler-compatible version
- **Node.js**: (optional, for additional tooling)
- **SQLite3**: Database
- **Docker**: (optional, for deployment testing)
- **Xcode**: iOS development

### セットアップコマンド
```bash
# Backend setup
cd backend
bin/setup

# Start development server
bin/dev

# Run tests (CI)
bin/ci
```

### iOS開発
```bash
cd ios
open kajilis.xcodeproj
# Xcodeでビルド＆実行
```

## 共通開発コマンド

### Backend
- `bin/rails`: Rails CLI
- `bin/rake`: Rake task runner
- `bin/dev`: Development server with live reload
- `bin/ci`: Run full CI suite (tests, security, linting)
- `bin/brakeman`: Security scan
- `bin/bundler-audit`: Dependency vulnerability check
- `bin/rubocop`: Code style check
- `bin/thrust`: HTTP acceleration layer

### Docker
- `docker build`: Build container (see Dockerfile)
- `bin/docker-entrypoint`: Container entrypoint script

## 環境変数

### 重要な設定変数
- `RAILS_MAX_THREADS`: Database connection pool size (default: 5)
- `RAILS_ENV`: Environment (development/test/production)
- `DATABASE_URL`: (optional) Database connection URL

### 機密情報管理
- `config/master.key`: Rails credentials暗号化キー (Git管理外)
- `config/credentials.yml.enc`: 暗号化された認証情報

## ポート設定

### 標準ポート
- **Rails Development Server**: 3000 (Puma default)
- **Xcode iOS Simulator**: Dynamic (Xcode managed)

## デプロイ

### Kamalデプロイ
```bash
# Deploy to production
kamal deploy

# Other Kamal commands
kamal setup    # Initial setup
kamal restart  # Restart services
```

### Docker構成
- **Dockerfile**: `backend/Dockerfile`
- **Entrypoint**: `bin/docker-entrypoint`
- **Persistent volumes**: `storage/` directory (production databases)
