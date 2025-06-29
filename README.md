# Stock Advisor AI

AIが株式を分析し、投資アドバイスを提供するWebアプリケーションです。

## 🚀 機能

- **株式検索**: アメリカ株、ETF、世界株式の検索
- **リアルタイム株価**: 現在価格、変動率、出来高などの表示
- **価格チャート**: インタラクティブな株価チャート（Recharts使用）
- **テクニカル分析**: RSI、MACD、ボリンジャーバンド、移動平均線
- **AI投資アドバイス**: 買い・売り・保有の推奨と理由
- **キャッシュ機能**: パフォーマンス向上のためのデータキャッシュ

## 🛠 技術スタック

### フロントエンド
- **Next.js 14** - React フレームワーク
- **TypeScript** - 型安全性
- **Tailwind CSS** - スタイリング
- **Recharts** - チャートライブラリ
- **Lucide React** - アイコン
- **Axios** - HTTP クライアント

### バックエンド
- **FastAPI** - Python Web フレームワーク
- **yfinance** - 株価データ取得
- **pandas** - データ処理
- **TA-Lib** - テクニカル分析
- **SQLite** - データベース
- **TextBlob** - センチメント分析（将来拡張用）

## 📋 前提条件

- **Node.js** 18.0 以上
- **Python** 3.10 以上
- **npm** または **yarn**

## 🔧 セットアップ

### 1. リポジトリのクローン

```bash
git clone <repository-url>
cd stock-advisor
```

### 2. バックエンドのセットアップ

```bash
cd backend

# 仮想環境の作成
python3 -m venv venv
source venv/bin/activate  # Windows: venv\\Scripts\\activate

# 依存関係のインストール
pip install -r requirements.txt

# 環境変数の設定（オプション）
cp .env.example .env
# .envファイルを編集してAPIキーを設定
```

### 3. フロントエンドのセットアップ

```bash
cd frontend

# 依存関係のインストール
npm install
# または
yarn install
```

## 🚀 アプリケーションの起動

### バックエンドサーバーの起動

```bash
cd backend
source venv/bin/activate  # 仮想環境をアクティベート
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

バックエンドAPIは `http://localhost:8000` で起動します。  
API ドキュメントは `http://localhost:8000/docs` で確認できます。

### フロントエンドの起動

```bash
cd frontend
npm run dev
# または
yarn dev
```

フロントエンドは `http://localhost:3000` で起動します。

## 📖 使用方法

1. **株式検索**: トップページの検索ボックスに銘柄コード（例：AAPL）または企業名を入力
2. **データ表示**: 株式情報、価格チャート、テクニカル指標、AI分析が表示されます
3. **分析確認**: AIによる投資アドバイスと根拠を確認できます

## 🔑 API エンドポイント

### 株式データ
- `GET /api/stocks/search?query={query}` - 株式検索
- `GET /api/stocks/{symbol}` - 株式情報取得
- `GET /api/stocks/{symbol}/history?period={period}` - 価格履歴
- `GET /api/stocks/{symbol}/indicators` - テクニカル指標
- `GET /api/stocks/{symbol}/analysis` - AI分析

### ヘルスチェック
- `GET /api/health` - サーバー状態確認

## 💾 データキャッシュ

アプリケーションはSQLiteを使用してデータをキャッシュし、外部APIへのリクエスト数を削減します：

- **株式情報**: 5分間キャッシュ
- **価格履歴**: 60分間キャッシュ
- **テクニカル指標**: 30分間キャッシュ
- **AI分析**: 15分間キャッシュ

## ⚠️ 注意事項

### 法的免責事項
本アプリケーションで提供される情報は投資勧誘を目的とするものではありません。最終的な投資判断はご自身の責任で行ってください。

### 使用制限
- yfinanceによるデータ取得には制限があります
- 商用利用する場合は、適切なライセンスのデータプロバイダーを使用してください
- 金融商品取引法等の関連法規を遵守してください

## 🚀 デプロイ

### Vercel（フロントエンド）
```bash
cd frontend
npx vercel --prod
```

### Render（バックエンド）
1. Renderアカウントにサインアップ
2. GitHubリポジトリを接続
3. backend ディレクトリをルートディレクトリとして設定
4. 環境変数を設定

## 🔧 開発

### コード品質
```bash
# バックエンド
cd backend
flake8 app/
black app/

# フロントエンド
cd frontend
npm run lint
npm run build
```

### テスト
```bash
# バックエンド
cd backend
pytest

# フロントエンド
cd frontend
npm test
```

## 📦 プロジェクト構造

```
stock-advisor/
├── frontend/                 # Next.js フロントエンド
│   ├── app/                 # App Router
│   ├── components/          # UIコンポーネント
│   ├── lib/                 # ユーティリティ
│   └── public/              # 静的ファイル
├── backend/                 # FastAPI バックエンド
│   ├── app/
│   │   ├── api/             # APIエンドポイント
│   │   ├── services/        # ビジネスロジック
│   │   ├── models/          # データモデル
│   │   └── database/        # データベース設定
│   └── requirements.txt     # Python依存関係
└── data/                    # SQLiteデータベース
```

## 🤝 コントリビューション

1. このリポジトリをフォーク
2. フィーチャーブランチを作成 (`git checkout -b feature/AmazingFeature`)
3. 変更をコミット (`git commit -m 'Add some AmazingFeature'`)
4. ブランチにプッシュ (`git push origin feature/AmazingFeature`)
5. プルリクエストを開く

## 📄 ライセンス

このプロジェクトはMITライセンスの下で提供されています。詳細は [LICENSE](LICENSE) ファイルを参照してください。

## 🔮 将来の拡張予定

- [ ] センチメント分析の実装
- [ ] 機関投資家データの統合
- [ ] より高度な機械学習モデル
- [ ] ポートフォリオ管理機能
- [ ] リアルタイム通知
- [ ] モバイルアプリ版

---

**免責事項**: このアプリケーションは教育・研究目的で作成されました。実際の投資判断には使用しないでください。