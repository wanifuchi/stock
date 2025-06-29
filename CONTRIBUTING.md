# Contributing to Stock Advisor AI

Stock Advisor AIプロジェクトへの貢献をお考えいただき、ありがとうございます！

## 🤝 貢献方法

### バグ報告
バグを発見した場合：
1. [Issues](../../issues)で既存の報告を確認
2. 新しいIssueを作成し、Bug reportテンプレートを使用
3. 再現手順、期待される動作、実際の動作を詳細に記載

### 機能リクエスト
新機能のアイデアがある場合：
1. [Issues](../../issues)で既存のリクエストを確認
2. Feature requestテンプレートを使用してIssueを作成
3. 機能の必要性と期待される効果を説明

### コード貢献

#### 開発環境のセットアップ
```bash
# リポジトリをフォーク・クローン
git clone https://github.com/YOUR_USERNAME/stock-advisor.git
cd stock-advisor

# バックエンド環境
cd backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt

# フロントエンド環境
cd ../frontend
npm install
```

#### 開発ワークフロー
1. **フォーク**: このリポジトリをフォーク
2. **ブランチ作成**: `git checkout -b feature/amazing-feature`
3. **実装**: 変更を実装
4. **テスト**: 動作確認とテスト実行
5. **コミット**: `git commit -m 'feat: add amazing feature'`
6. **プッシュ**: `git push origin feature/amazing-feature`
7. **PR作成**: Pull Requestを作成

## 📋 コーディング規約

### フロントエンド (TypeScript/React)
- **ESLint**: 設定されたルールに従う
- **命名**: camelCase for variables/functions, PascalCase for components
- **型安全性**: `any`の使用を避け、適切な型定義を使用
- **コンポーネント**: 再利用可能で単一責任の原則に従う

### バックエンド (Python)
- **PEP 8**: Python標準のコーディング規約に従う
- **型ヒント**: 関数の引数と戻り値に型ヒントを追加
- **docstring**: 関数とクラスにドキュメンテーション文字列を追加
- **エラーハンドリング**: 適切な例外処理を実装

## 🧪 テスト

### フロントエンド
```bash
cd frontend
npm run lint      # ESLintチェック
npm run build     # ビルドテスト
npx tsc --noEmit  # 型チェック
```

### バックエンド
```bash
cd backend
python -c "import app.main"  # インポートテスト
# pytest tests/              # ユニットテスト（将来実装）
```

## 📝 コミットメッセージ

Conventional Commitsの形式を使用：

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### タイプ
- `feat`: 新機能
- `fix`: バグ修正
- `docs`: ドキュメント更新
- `style`: フォーマット変更（コード動作に影響なし）
- `refactor`: リファクタリング
- `test`: テスト追加・修正
- `chore`: その他の変更

### 例
```
feat(api): add sentiment analysis endpoint
fix(chart): resolve price data display issue
docs(readme): update deployment instructions
```

## 🚨 重要な注意事項

### 投資助言に関する規制
- 本プロジェクトは教育・研究目的です
- 投資助言業務に該当する機能は実装しないでください
- 免責事項を適切に表示してください

### セキュリティ
- APIキーや機密情報をコードに含めないでください
- 環境変数を使用してください
- セキュリティ脆弱性を発見した場合は、公開せずに直接報告してください

### データ使用
- yfinanceは非商用利用のみです
- 商用利用時は適切なライセンスのデータソースを使用してください
- レート制限を遵守してください

## 📞 質問・サポート

- **一般的な質問**: [Discussions](../../discussions)を使用
- **バグ報告**: [Issues](../../issues)を使用
- **セキュリティ関連**: プライベートで報告

## 🙏 行動規範

すべての貢献者は以下の行動規範に従ってください：

- 敬意を持って他の貢献者と接する
- 建設的なフィードバックを提供する
- 包括的でウェルカムな環境を維持する
- プロジェクトの目標に焦点を当てる

## 📜 ライセンス

貢献することにより、あなたの貢献がMITライセンスの下でライセンスされることに同意するものとします。

---

貢献してくださる皆様、ありがとうございます！🎉