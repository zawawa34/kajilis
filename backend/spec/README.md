# RSpec Test Suite

このディレクトリには、backendプロジェクトのRSpecテストが含まれています。

## セットアップ

RSpecとその関連gemは既にインストールされています：

- `rspec-rails` - Rails用のRSpecテストフレームワーク
- `factory_bot_rails` - テストデータの作成
- `faker` - ダミーデータの生成
- `shoulda-matchers` - より良いマッチャー

## テストの実行

すべてのテストを実行：
```bash
bundle exec rspec
# または
bin/rspec
```

詳細な出力でテストを実行：
```bash
bundle exec rspec --format documentation
```

特定のファイルを実行：
```bash
bundle exec rspec spec/models/application_record_spec.rb
```

特定の行のテストを実行：
```bash
bundle exec rspec spec/models/application_record_spec.rb:3
```

## ディレクトリ構造

```
spec/
  ├── models/         # モデルのテスト
  ├── requests/       # リクエストスペック（APIテスト）
  ├── factories/      # FactoryBotのファクトリ定義
  ├── rails_helper.rb # Rails固有の設定
  └── spec_helper.rb  # RSpecの基本設定
```

## 新しいテストの作成

### モデルのテスト

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:email) }
end
```

### リクエストスペック

```ruby
require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns a success response" do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end
end
```

### FactoryBotの使用

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  it "has a valid factory" do
    expect(user).to be_valid
  end
end
```

## 参考リンク

- [RSpec Rails Documentation](https://rspec.info/features/7-1/rspec-rails/)
- [FactoryBot Documentation](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)
- [Shoulda Matchers Documentation](https://github.com/thoughtbot/shoulda-matchers)
