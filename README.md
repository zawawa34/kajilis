# Kajilis

家族が楽しく効率的に家事を行うためのタスク管理・コミュニケーションツール

## 概要

Kajilisは、家族みんなで家事や買い物を共有・管理できるiOSアプリケーションです。日々の家事タスク、買い物リスト、献立管理を一つのアプリで簡単に管理できます。

### 主な機能

- **買い物リスト**: 家族で共有できる買い物リストの作成・管理
- **献立管理**: 週間献立の計画と共有
- **家事タスク管理**: 日々の家事タスクの割り当てと進捗管理

### 対象ユーザー

すべての家族向けに設計されています。

## 技術スタック

### iOS アプリケーション
- **言語**: Swift 5.0
- **UI Framework**: SwiftUI
- **最小デプロイメントターゲット**: iOS 26.0

### バックエンド API
- **言語**: Ruby 3.4.6
- **フレームワーク**: Ruby on Rails 8.1.1
- **データベース**: SQLite3
- **Webサーバー**: Puma

## 必要要件

### iOS開発
- macOS
- Xcode（iOS 26.0 SDK対応版）
- CocoaPods または Swift Package Manager（依存関係管理）

### バックエンド開発
- Ruby 3.4.6 以上
- Bundler
- SQLite3

## セットアップ

### バックエンドのセットアップ

```bash
# リポジトリのクローン
git clone <repository-url>
cd kajilis/backend

# 依存関係のインストールとデータベースのセットアップ
bin/setup

# 開発サーバーの起動
bin/dev
```

バックエンドサーバーは `http://localhost:3000` で起動します。

### iOSアプリのセットアップ

```bash
# iOSプロジェクトディレクトリに移動
cd kajilis/ios

# Xcodeでプロジェクトを開く
open kajilis.xcodeproj
```

Xcodeでプロジェクトを開いた後：
1. シミュレーターまたは実機を選択
2. ビルド＆実行（⌘ + R）

## 開発ガイド

### バックエンド開発コマンド

```bash
# Rails コンソール
bin/rails console

# データベースマイグレーション
bin/rails db:migrate

# テスト・セキュリティチェック・Lintの実行
bin/ci

# 個別ツール実行
bin/rubocop        # コードスタイルチェック
bin/brakeman       # セキュリティ脆弱性スキャン
bin/bundler-audit  # 依存関係の脆弱性チェック
```

### iOS開発

- Xcode上でビルド・実行・デバッグを行います
- テストは `⌘ + U` で実行できます

## 認証・アクセス管理

家族メンバーは**招待制**でアプリに参加します。既存メンバーが新しいメンバーを招待し、家族グループを形成します。

## プロジェクト構造

```
kajilis/
├── backend/           # Rails APIバックエンド
│   ├── app/          # アプリケーションコード
│   ├── config/       # 設定ファイル
│   ├── db/           # データベース関連
│   └── bin/          # 実行スクリプト
├── ios/              # iOSアプリケーション
│   ├── kajilis/      # アプリケーションコード
│   ├── kajilisTests/ # ユニットテスト
│   └── kajilisUITests/ # UIテスト
├── .kiro/            # Spec-Driven Development ドキュメント
│   ├── steering/     # プロジェクトステアリングドキュメント
│   └── specs/        # 機能仕様
└── .claude/          # Claude Code設定
```

詳細なプロジェクト構造については [.kiro/steering/structure.md](.kiro/steering/structure.md) を参照してください。

## 開発プロセス

このプロジェクトは **Kiro Spec-Driven Development** 手法を採用しています。

新機能の開発手順：
1. `/kiro:spec-init` - 機能仕様の初期化
2. `/kiro:spec-requirements` - 要件定義
3. `/kiro:spec-design` - 技術設計
4. `/kiro:spec-tasks` - 実装タスク分解
5. `/kiro:spec-impl` - TDD方式での実装

詳細は [CLAUDE.md](CLAUDE.md) を参照してください。

## ライセンス

(ライセンス情報をここに記載)

## コントリビューション

(コントリビューションガイドラインをここに記載)
