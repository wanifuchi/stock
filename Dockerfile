# Python 3.10ベースイメージ
FROM python:3.10-slim

# 作業ディレクトリを設定
WORKDIR /app

# システムの依存関係をインストール
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# バックエンドディレクトリをコピー
COPY backend/ ./

# Python依存関係をインストール
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションを起動
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

# ポートを公開
EXPOSE 8000