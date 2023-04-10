# Stuctive

『Stuctive』はステイホーム続きで減ってしまった外の付き合いと、勉学でも切磋琢磨できる仲間とのマッチングを意識して作成した、アプリです。
ログイン無しでも閲覧は可能ですのでお気軽にご覧下さい。(ゲストログインも用意しています)

### [リンク]：( https://stuctive.link )

<br>

#### トップページ

![トップページ](https://user-images.githubusercontent.com/62534064/173287687-3a45eff2-9fd3-4689-a0a5-023b0091c480.jpg "トップ画像")
<br>

## 特に見ていただきたい点

- インフラ
  - ローカル環境からデプロイまで Docker を使い、ECS(FARGATE)/ECR で本番環境をサーバーレスで運用している点。
  - AWS を使い、ALB を通すことで常時 SSL 通信を行っている点。
  - Terraform を使い、本番環境インフラをコードで管理している点。
  - CircleCI を使い、CI/CD パイプラインを構築している点。
- バックエンド
  - Ruby on Rails の API モードを利用し、API サーバーとしてフロントエンドからのリクエストに対して<br>JSON データを返している点
  - トークン認証を利用したログインを実装してる点。
- フロントエンド
  - Nuxt.js を採用し、SPA（シングルページアプリケーション）で配信している点。
  - UI フレームワークに Vuetify を使用し、整った UI を意識している点
- その他
  - フロント側では ESLint/Prettier、バックエンドで rubcop といったコード解析ツールを採用し<br>読みやすいコードを意識している点
  - 参加するまでのコンバージョン率を上げるために、ページ遷移を無くし、index ページ上で作業を完結できるようにした点。
  - 参加を検討するために、ストックリストを用意した点。

<br>

## 使用した技術

- フロントエンド
  - HTML/CSS
  - Javascript
  - Nuxt.js（SPA モード）
  - Vuetify（UI フレームワーク）
  - Jest（テスト）
  - ESLint/Prettier（コード解析ツール）
- バックエンド
  - Ruby 2.7.2
  - Ruby on Rails 6.0.4.4 （API モード）
  - Rubocop（コード解析ツール）
  - RSpec（テスト）
- インフラ・開発環境
  - Docker/Docker-compose
  - AWS（ECR,ECS,VPC,S3,Route53,ALB,RDS,ACM,SSM）
  - Terraform（インフラのコード管理）
  - CircleCI（CI/CD）

<br>

## ER 図

<br>

![ER](https://user-images.githubusercontent.com/62534064/183581200-8fe83693-e04a-4dca-b696-1ab86252e148.png "ER図")
<br>

## AWS 構成図

<br>

![AWS](https://user-images.githubusercontent.com/62534064/173287190-88a77c3a-b76b-4cff-b17f-2673b5f4aa37.png "インフラ構成図")
<br>

<br>

## 機能一覧

- 基本機能
  - 新規ユーザー登録
  - 登録ユーザー削除
  - ユーザー登録情報変更<br>(アイコン画像・プロフィール・パスワード・メールアドレス)
  - ユーザーマイページ<br>(いいね・参加・メッセージ・フォロー・フォロワー)
  - ログイン機能(ゲストログインも含む)
  - ユーザーフォロー機能
- 投稿機能
  - CRUD(作成・読取・更新・削除)
  - いいね機能
  - 参加機能
  - 検索機能
  - 参加者一覧
  - 画像投稿
- メッセージ機能
  - CRUD(作成・読取・更新・削除)
  - 画像投稿
  - 画像プレビュー
- 管理者機能
  - 全投稿削除・編集
  - 全ユーザー削除
  - 全メッセージ削除
