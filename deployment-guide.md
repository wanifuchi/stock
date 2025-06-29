# 🚀 デプロイメントガイド

このガイドでは、Stock Advisor AIアプリケーションをVercel（フロントエンド）とRailway（バックエンド）にデプロイする手順を説明します。

## 📋 前提条件

- GitHubアカウント
- Vercelアカウント
- Railwayアカウント
- このリポジトリがGitHubにプッシュされていること

## 🔧 1. GitHubリポジトリの準備

### リポジトリ作成
```bash
# GitHubで新しいリポジトリを作成後
git remote add origin https://github.com/YOUR_USERNAME/stock-advisor.git
git push -u origin main
```

## 🎨 2. Vercel（フロントエンド）のデプロイ

### 2.1 Vercelプロジェクト作成
1. [Vercel Dashboard](https://vercel.com/dashboard)にアクセス
2. 「New Project」をクリック
3. GitHubリポジトリを選択
4. 以下の設定を行う：

**Project Settings:**
- **Framework Preset**: Next.js
- **Root Directory**: `frontend`
- **Build Command**: `npm run build`
- **Output Directory**: `.next`

### 2.2 環境変数設定
Vercelの「Settings」→「Environment Variables」で設定：

```
NEXT_PUBLIC_API_URL=https://your-railway-app.railway.app
```

### 2.3 自動デプロイ設定
- `main`ブランチへのプッシュで自動デプロイが実行されます
- GitHub Actionsワークフローも設定済みです

## 🚂 3. Railway（バックエンド）のデプロイ

### 3.1 Railwayプロジェクト作成
1. [Railway Dashboard](https://railway.app/dashboard)にアクセス
2. 「New Project」をクリック
3. 「Deploy from GitHub repo」を選択
4. リポジトリを選択

### 3.2 サービス設定
**Settings**で以下を設定：

- **Source**: `backend`ディレクトリ
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
- **Healthcheck Path**: `/api/health`

### 3.3 環境変数設定（オプション）
Railwayの「Variables」タブで設定：

```bash
# オプション：APIキーを使用する場合
ALPHA_VANTAGE_API_KEY=your_api_key_here
FMP_API_KEY=your_fmp_key_here
ENVIRONMENT=production
```

### 3.4 カスタムドメイン設定（オプション）
- 「Settings」→「Domains」でカスタムドメインを設定可能
- 無料プランでは `.railway.app` サブドメインが利用可能

## 🔄 4. GitHub Actions設定

### 4.1 Vercel自動デプロイ
Vercelトークンを取得してGitHubシークレットに設定：

**GitHub Settings** → **Secrets and variables** → **Actions**:
```
VERCEL_TOKEN=your_vercel_token
ORG_ID=your_vercel_org_id
PROJECT_ID=your_vercel_project_id
```

### 4.2 Railway自動デプロイ
Railwayトークンを設定：

```
RAILWAY_TOKEN=your_railway_token
RAILWAY_SERVICE=your_service_id
```

## 🔍 5. デプロイ確認

### フロントエンド確認
```bash
# Vercelデプロイ後のURL例
https://stock-advisor-frontend.vercel.app
```

### バックエンド確認
```bash
# RailwayデプロイURL例
https://stock-advisor-backend.railway.app/docs
```

### 動作テスト
1. フロントエンドにアクセス
2. 株式検索機能をテスト（例：「AAPL」で検索）
3. チャートとデータが正常に表示されることを確認

## 🐛 6. トラブルシューティング

### よくある問題

#### フロントエンドビルドエラー
```bash
# ローカルでビルドテスト
cd frontend
npm run build
```

#### バックエンド起動エラー
```bash
# ローカルで確認
cd backend
uvicorn app.main:app --reload
```

#### API接続エラー
- CORS設定を確認
- 環境変数のURLが正しいか確認
- ネットワークタブでAPIリクエストを確認

### ログ確認
- **Vercel**: Function Logs タブ
- **Railway**: Deployments → View Logs

## 📊 7. 監視とメンテナンス

### パフォーマンス監視
- Vercel Analytics（無料プランで利用可能）
- Railway Metrics（CPU、メモリ使用量）

### 定期メンテナンス
- 依存関係の更新
- セキュリティパッチの適用
- データベースのクリーンアップ

### バックアップ
```bash
# SQLiteデータベースのバックアップ
# Railway CLI を使用してファイルをダウンロード
railway connect
# データベースファイルをローカルにコピー
```

## ⚠️ 8. 注意事項

### 無料プラン制限
- **Vercel**: 帯域幅制限、関数実行時間制限
- **Railway**: 月間使用時間制限、リソース制限

### スケーリング
- トラフィック増加時は有料プランへのアップグレードを検討
- データベースの分離（PostgreSQL等への移行）

### セキュリティ
- APIキーの適切な管理
- HTTPS通信の確保
- レート制限の実装

## 🎉 完了！

これでStock Advisor AIアプリケーションが本番環境で稼働します。ユーザーは以下のURLからアクセス可能です：

- **メインアプリ**: https://your-app.vercel.app
- **API ドキュメント**: https://your-api.railway.app/docs

何か問題が発生した場合は、GitHubの Issues でサポートを求めてください。