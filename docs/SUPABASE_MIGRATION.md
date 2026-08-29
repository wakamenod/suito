# Suito バックエンド → Supabase 全面移行プラン

## Context（なぜやるか）

Suito は個人向けの家計簿アプリ。Flutter アプリ（モバイルが本体、`web/` は Google Play の
「アカウント削除ポリシー対応」専用の極小 Flutter web アプリ）と、自前実装の Go バックエンドで構成されている。

- 現バックエンド: Go（echo + gorm）+ MySQL 8.0 + Firebase Auth（ID トークン検証）+ 
  in-process の gocron ジョブ。AWS Lightsail 上で docker-compose + nginx + Lego(Let's Encrypt) で運用。
- **このプロジェクトはリリース前で実ユーザーがゼロ**。Play Store は内部テスト配信のみ。

目的は、自前 Go バックエンドの運用・保守負担（Lightsail の面倒、手動 scp デプロイ、
DB 運用、証明書、cron ジョブのお守り）をなくすこと。Go 実装自体はポートフォリオとして価値があるため
**別リポジトリに履歴ごと切り出して保存**し、本プロジェクトからは `backend/` を撤去する。

リリース前ゆえ認証・データ移行のコストがゼロなので、**認証も含めて完全に Supabase へ寄せる**判断とする。

## 方針: フル Supabase（Auth + Postgres + RLS + pg_cron + Edge Functions）

### なぜ Supabase か（他候補との比較結論）

- **Postgres なのでリレーショナルモデルと SQL 集計を維持できる**。チャート集計・定期取引エンジンは
  MySQL 方言 → Postgres 方言の「翻訳」で済み、再設計が不要。
- **RLS が `WHERE uid = ?` の完全な代替**。テーブルごとに `user_id = auth.uid()` のポリシー1つ。
- **孤児ユーザー削除ジョブ（毎時 + Firebase Admin 依存）が丸ごと不要になる** — `auth.users` からの
  `ON DELETE CASCADE` でユーザー削除時にデータが自動消去される。
- **`pg_cron`** が毎月の定期取引ジョブを DB 内で完結させる。
- 無料枠は固定上限の常時無料（超過自動課金なし・カード不要）。本ワークロードは数年 500MB に届かず、
  実質ずっと無料。Pro（$25/月）に上げる理由は「7日無アクセス時の一時停止をなくす」「日次バックアップ」のみ。
- Firestore を却下した理由: NoSQL だとチャート集計・レポート層を事前集計方式に再設計する必要があり工数が跳ねる。
- Lambda / Cloudflare Workers を却下した理由: API 層・IaC・マイグレーションを自分で持ち続けることになり、
  「SaaS に移して保守を減らす」目的と相反する。

## ターゲット構成

### 認証
- Supabase Auth、Email/Password（現状と同じ方式）。
- Flutter: `firebase_auth` + `firebase_ui_auth` → `supabase_flutter`（`supabase_auth_ui` は不採用、下記）。
- **本番の認証メールは自前 SMTP が必要**（Supabase 内蔵 SMTP は時間3〜4通制限）。Resend 無料枠（月3000通）
  または AWS SES を Auth 設定に接続する。
- `web/` のアカウント削除アプリ: 削除ボタンを Supabase 版に置換。
  **削除処理は Edge Function `delete-account` に統一**（Service Role Key で `auth.admin.deleteUser(uid)` を呼ぶ）。
  `SECURITY DEFINER` RPC で `auth.users` を直接 DELETE する設計は search_path 攻撃・権限漏洩のリスクがあり、
  かつ `auth.users` への直接 DELETE は非公式ルートのため採用しない。
  Function 内では呼び出し元の JWT を検証し、`user.id` 以外は削除できないようにする。
  各ドメインテーブルの `auth.users` への FK が `ON DELETE CASCADE` なので、Function は Auth ユーザー削除を呼ぶだけで
  全データ消去まで完結する。

### データベース
Supabase Postgres。スキーマは `ddl/migrations/001_init.up.sql` / `002_user.up.sql` から移植。主な変更:

- **`user` テーブルと MySQL 生成カラム / 複合ユニークインデックスの小技を廃止**。アイデンティティは
  `auth.users` が所有する。全テーブルの `uid VARCHAR(128)` を `user_id uuid references auth.users(id) on delete cascade` に置換。
- **実 FK を追加**:
  - `expense.expense_category_id -> expense_category(id) on delete set null`
  - `expense.expense_location_id -> expense_location(id) on delete set null`
  - `income.income_type_id -> income_type(id) on delete set null`（現状の挙動に合わせるか要検討。下記 Open items）
  - これで `expense_categories.go` / `expense_locations.go` の「削除時に参照を空文字で潰す」アプリ側ロジックが不要になる。
- **PK は `xid` 文字列 → `uuid` v7**。`pg_uuidv7` 拡張を有効化し `default uuid_generate_v7()` を採番に使う。
  （プロジェクトで `pg_uuidv7` が使えるか `select * from pg_available_extensions where name = 'pg_uuidv7'` で確認。
  無ければ SQL 定義の uuidv7 関数、または Postgres 18+ の `uuidv7()`。`gen_random_uuid()` は v4 = 完全ランダムで
  B-tree インデックス断片化を招くため使わない。）
  v7 は時系列ソート可能なので、id 昇順をタイブレークに使っている箇所
  （`transaction_service.go` のソート、`FindExpenseCategories` の `order by id desc`）は **そのまま維持できる**。
- `amount` は整数（円）のまま、`local_date DATE` のまま。
- `updated_at` は Postgres トリガーで自動更新。
- カテゴリ / ロケーション / インカムタイプの `UNIQUE (user_id, name)` はそのまま移植。
- ソフトデリート `deleted_at` は「アプリが実際に絞り込んでいる」expense / income / *_schedule のみ残し、
  参照テーブルからは外す方向（下記 Open items）。

### テナント分離（RLS）
- 全テーブルで RLS 有効化。
- ドメインテーブル: `user_id = auth.uid()` を select / insert / update / delete それぞれに設定。
- `scheduled_expense_queue` / `scheduled_income_queue`:
  - **クライアントからの書き込み権限を剥奪**: `revoke insert, update, delete on scheduled_expense_queue from authenticated, anon`。
    クライアントは queue を一切書かない（`/schedules` 相当はスケジュール本体を返すのみ）。
  - SELECT のみ許可（親スケジュールとの join ポリシー）:
    `exists (select 1 from expense_schedule s where s.id = expense_schedule_id and s.user_id = auth.uid())`。
    クライアントが queue 状態を表示しないなら SELECT も剥奪してよい。
  - queue への INSERT/DELETE は **`SECURITY DEFINER`（postgres 所有）のトリガー関数と pg_cron 実行の関数からのみ**行う。

### 読み書き
- Flutter は `supabase_flutter`（PostgREST）で Supabase を直接叩く。
- `mobile/lib/src/features/*/repositories/*.dart`（約30本）を Supabase クエリビルダ / `.rpc()` に書き換え。
- **`services/` と `presentations/` 層、Riverpod プロバイダ構造はそのまま** — データアクセスの呼び出し箇所だけ変わる。
- OpenAPI 生成クライアント・dio・`openapi_provider.dart` の Bearer インターセプタは全廃。

### 集計（現 `/chart/*`, `/transactions*` 相当）
Postgres 関数として実装し RPC 公開、または SQL ビュー:

- `transaction_months()` — `UNION` + `to_char(local_date, 'YYYY-MM')`、`DISTINCT`、降順。
- `column_chart_data(p_user_id)` — `SUM(amount) GROUP BY category, date_trunc('month', local_date)`。
  月軸のパディング（欠損月を null 埋め）は **Dart 側に残す**（現 `chart_service.go` の `groupByCategory` を移植）。
- `pie_chart_data(p_start, p_end)` — 期間指定のカテゴリ別 / ロケーション別 SUM。
- トランザクション一覧（expense + income のマージ / ソート）— **Dart 側で2クエリをマージ**
  （現 `transaction_service.go` の `ListTransactionsService` を移植）。SQL ビューでも可。

### 定期取引エンジン
- `enqueue_transaction_schedules()` と `create_transactions_from_queue()` を Postgres 関数化
  （**`SECURITY DEFINER` / owner=postgres**。queue テーブルの grant を無視して INSERT/DELETE できるようにする）。
- MySQL の `CONVERT_TZ(NOW(), 'UTC', s.timezone)` 系の日付演算を Postgres へ移植:
  `(now() at time zone 'UTC') at time zone s.timezone`、翌月1日03:00 は
  `date_trunc('month', local_now) + interval '1 month' + interval '3 hours'` を `s.timezone` で UTC 戻し。
- `pg_cron` でスケジュール:
  - `cron.schedule('enqueue-schedules', '45 * * * *', $$select enqueue_transaction_schedules()$$)`
  - `cron.schedule('materialize-transactions', '15 * * * *', $$select create_transactions_from_queue()$$)`
  - **pg_cron は UTC 実行**。現コードは JST 実行なので cron 式はそのままで問題ない（毎時実行のため）。
- `POST /expense-schedule` が作成時に同期 enqueue していた挙動 → `expense_schedule` / `income_schedule` への
  `AFTER INSERT` トリガーで `enqueue_transaction_schedules()` を呼ぶ。

### 孤児ユーザー削除ジョブ
- **廃止**。`auth.users` からの `ON DELETE CASCADE` が担う。
- Supabase Auth 経由でユーザーが自己削除 → 全ドメインテーブルの該当行が自動削除される。

### バージョンチェック（強制アップデート）
- 現 `/version` エンドポイント（`version_check.dart` が使用）→ 単一行の `app_config` テーブルを
  PostgREST で読む方式に置換。`version_check.dart` の参照先を差し替え。

### 廃止されるもの
- nginx の `X-Suito-Header` ゲート（nginx ごと不要）。アクセス制御は anon key + RLS。
- `backend/` 全体、`ddl/`、`docker-compose*.yml`、Lightsail、Lego 証明書、手動 scp デプロイ。
- `backend/docs/swagger.*` と `makers swag` / `makers api-generate` タスク。

## クライアント（Flutter）変更

対象: `mobile/`（本体）と `web/`（アカウント削除アプリ）

- `mobile/pubspec.yaml`: `firebase_*` / `dio` / ローカル `openapi` パッケージを削除。`supabase_flutter` を追加。
  **`supabase_auth_ui` は採用しない**（カスタマイズ性が低く Riverpod / formz とバッティングしやすい）。
- 削除: `mobile/lib/src/data/openapi_provider.dart`、`mobile/openapi/` ディレクトリ一式。
- 新規: `mobile/lib/src/data/supabase_provider.dart`（`SupabaseClient` を公開する Riverpod プロバイダ）。
- 書き換え: `features/*/repositories/*.dart` 約30本を `supabase.from('expense').select()...` / `.rpc()` へ。
  代表例:
  - `features/transactions/repositories/transaction/transactions_repository.dart`
  - `features/transactions/repositories/expense/*.dart`（6本）
  - `features/transactions/repositories/income/*.dart`（4本）
  - `features/charts/repositories/*.dart`
  - `features/schedules/repositories/*.dart`
  - `features/transaction_attributes/**/repositories/*.dart`
- `main.dart` / `firebase_options.dart` のブートストラップ → `Supabase.initialize(url:, anonKey:)`。
- 認証画面: `custom_sign_in_screen.dart` / `custom_profile_screen.dart` / `custom_sign_out_screen.dart`
  の **UI 構造・画面遷移はそのまま維持**し、内部の認証コールだけ差し替える:
  `firebase_ui_auth` のプリビルト `SignInScreen` / `ProfileScreen` → 既存の `formz` + `common_widgets/*`
  （`text_input_field.dart` 等）で組んだ薄い自前フォーム + `supabase.auth.signInWithPassword()` /
  `signUp()` / `signOut()` の直接呼び出し。エラーは既存の `AppException` / `async_error_logger.dart` 経路に載せる。
  ルーター（`app_router.dart`）の `firebaseAuth.authStateChanges()` 監視 → `supabase.auth.onAuthStateChange`。
- envied `.env.mobile`: 全 `FIREBASE_*` キーを `SUPABASE_URL` / `SUPABASE_ANON_KEY` に置換。
- テスト: `fake_*_repository.dart` を新インターフェースに合わせて更新。`golden` / ロジックテストは維持。
- `web/`: `delete_account_screen.dart` / `sign_in_screen.dart` を Supabase 版に。

## CI / リポジトリ構成の変更

- `.github/workflows/suito_backend.yaml` と `suito_backend_lint.yml` を削除（backend 用リポジトリへ移動）。
- `.github/workflows/suito_mobile.yaml`: base64 の Firebase plist / json 注入ステップを削除。
  代わりに `SUPABASE_URL` / `SUPABASE_ANON_KEY` を注入。
- **新規 `.github/workflows/supabase-keep-alive.yml`**（初期段階で構築）: `schedule` cron で1日1回、
  Supabase REST API（`app_config` テーブルへの軽い `select`）に anon key で ping。
  Free 枠の「7日間無アクセスで自動 Pause」を回避する。Pause 判定は API ゲートウェイのリクエスト基準で、
  **pg_cron の DB 内アクティビティでは回避できない**ため必須。
- 新規 `supabase/` ディレクトリ（Supabase CLI 管理）:
  ```
  supabase/
    config.toml
    migrations/          # スキーマ + RLS + 関数 + cron（ddl/migrations から移植）
    functions/
      delete-account/    # 自己アカウント削除（web アプリ用）
      app-version/        # 任意: 強制アップデート設定
    seed.sql             # 任意: 開発用シード
  ```
- ルート `Makefile.toml`: backend / migrate 系タスクを削除、`supabase db push` / `supabase functions deploy` を追加。

## Go バックエンドの切り出し（ポートフォリオ保存）

- `git filter-repo --path backend/ --path ddl/ --path docker-compose.yml --path docker-compose-prod.yml`
  等で履歴を保持したまま新リポジトリ（例: `suito-go-backend`）へ分離。
- 本リポジトリからは `backend/`・`ddl/`・`docker-compose*.yml`・backend CI を削除。
- `README.org` / `Wiki.org` / `drawio/system2.drawio` を新構成に更新（Lightsail / SSM / nginx 記述を撤去）。

## フェーズ分割

各フェーズは独立した成果物と検証を持つ。フェーズ1〜2は**既存構成に一切触れない追加のみ**（ロールバック＝Supabase プロジェクト削除）。
フェーズ3〜4は feature ブランチ上で作業。フェーズ5は破壊的作業で、フェーズ4を内部テスト配信で動作確認してから着手する。

---

### フェーズ0: 事前決定（1日以内）
下記 Open items を確定させる（ソフトデリート範囲、`income` 削除、FK `on delete` 挙動、`pg_uuidv7` の可用性確認）。
`select * from pg_available_extensions where name in ('pg_uuidv7','pg_cron')` を作成直後のプロジェクトで実行。

---

### フェーズ1: Supabase 基盤（スキーマ + RLS）
**やること**
- Supabase プロジェクト作成（Free）。Supabase CLI で `supabase init` / `supabase link`。
- `0001_extensions.sql`: `pg_uuidv7`（無ければ代替 uuidv7 関数）、`pg_cron` を有効化。
- `0002_init.sql`: 9 ドメインテーブルを Postgres へ移植。`id uuid default uuid_generate_v7()`、
  `user_id uuid references auth.users on delete cascade`、実 FK、インデックス、`updated_at` トリガー。
- `0003_rls.sql`: 全テーブル RLS 有効化 + `user_id = auth.uid()` ポリシー。
  queue テーブルは SELECT のみ（join ポリシー）+ `revoke insert,update,delete ... from authenticated, anon`。

**検証**
- `supabase db reset`（ローカル）でクリーン適用。
- RLS（pgTAP または手動 2ユーザー）: A は自分の行のみ select / A は B の `user_id` で insert 不可 / A は B の行を読めない /
  A（authenticated）が `scheduled_expense_queue` へ insert/update/delete 不可。

**成果物**: Studio から触れる本番同等スキーマ。既存の Go / MySQL / Lightsail は無傷。

---

### フェーズ2: サーバーサイドロジック（関数 + cron + Auth + Function）
**やること**
- `0004_functions.sql`: `enqueue_transaction_schedules()` / `create_transactions_from_queue()`（両者 `SECURITY DEFINER`）、
  `column_chart_data()` / `pie_chart_data()` / `transaction_months()`、`*_schedule` の `AFTER INSERT` トリガー。
  MySQL の `CONVERT_TZ` 系日付演算を `at time zone` へ移植。
- `0005_cron.sql`: `enqueue-schedules`（`45 * * * *`）/ `materialize-transactions`（`15 * * * *`）を `cron.schedule`。
- `app_config` テーブル（バージョンチェック用、単一行）。
- Auth 設定: Email プロバイダ有効化、カスタム SMTP（Resend 等）接続、リダイレクト URL。
- Edge Function `delete-account`（Service Role Key で `auth.admin.deleteUser`、呼び出し元 JWT を検証し自分の id のみ許可）。
- `.github/workflows/supabase-keep-alive.yml`（1日1回 `app_config` へ ping）。

**検証**
- 定期取引エンジン: `timezone='Asia/Tokyo'` の `expense_schedule` を insert → トリガーが queue に正しい UTC
  `scheduled_at`（翌月1日 03:00 JST）を積む。過去日付 queue 行を仕込み `create_transactions_from_queue()` 手動実行
  → 正しい `local_date` の `expense` 行が生成、queue 行が削除。
- チャート: 複数月・複数カテゴリをシード → `rpc('column_chart_data')` / `rpc('pie_chart_data')` /
  `transaction_months()` が手計算と一致。
- `delete-account`: 他ユーザーの id を渡すと拒否。自分を渡すと `auth.users` 行と全ドメイン行が cascade 消去。

**成果物**: アプリ無しで検証済みのフル機能バックエンド。既存構成なお無傷。

---

### フェーズ3: Flutter 認証切り替え（feature ブランチ）
**やること**
- `mobile/pubspec.yaml`: `firebase_core` / `firebase_auth` / `firebase_ui_auth` を削除、`supabase_flutter` 追加。
- `main.dart` ブートストラップ → `Supabase.initialize(url:, anonKey:)`。`firebase_options.dart` 削除。
- 新規 `mobile/lib/src/data/supabase_provider.dart`（`SupabaseClient` を返す Riverpod プロバイダ）。
- 認証画面（`custom_sign_in_screen.dart` / `custom_profile_screen.dart` / `custom_sign_out_screen.dart`）:
  UI 構造は維持、内部を `formz` + `common_widgets/*` の薄い自前フォーム + `supabase.auth.signInWithPassword()` /
  `signUp()` / `signOut()` 直接呼び出しに。
- `app_router.dart`: `firebaseAuth.authStateChanges()` 監視 → `supabase.auth.onAuthStateChange`。
- envied `.env.mobile`: `FIREBASE_*` → `SUPABASE_URL` / `SUPABASE_ANON_KEY`。
- `.github/workflows/suito_mobile.yaml`: Firebase plist/json 注入を削除、Supabase キー注入に。

**検証**: サインアップ / サインイン / サインアウト / アプリ再起動でのセッション永続 / 未ログイン時のルートガード。
（データ画面はこの時点では壊れていてよい。）

**成果物**: 認証が完全に Supabase 上で動作。

---

### フェーズ4: Flutter データ層書き換え（同ブランチ、feature 単位）
`features/*/repositories/*.dart` を `supabase.from(...)` / `.rpc()` に書き換え。サブフェーズごとに該当画面を実機確認。

- **4a. transactions**: `transactions_repository.dart`、`repositories/expense/*`（6本）、`repositories/income/*`（4本）。
  一覧マージ / ソート / 月次合計は Dart 側に移植（現 `transaction_service.go` 相当）。
- **4b. transaction_attributes**: categories / locations / income types の CRUD リポジトリ。
- **4c. charts**: `features/charts/repositories/*` → `rpc('column_chart_data')` / `rpc('pie_chart_data')`。
  月軸パディングは Dart 側に移植（現 `chart_service.go` の `groupByCategory` 相当）。
- **4d. schedules**: expense / income schedule の CRUD + 一覧リポジトリ。作成時の同期 enqueue は DB トリガーが担うので Dart 側から削除。
- 仕上げ: `openapi_provider.dart` / `mobile/openapi/` 削除、`dio` 依存削除、`version_check.dart` を `app_config` 参照に、
  `fake_*_repository.dart` を新インターフェースに更新、`makers test`（mobile）グリーン、`makers swag` / `api-generate` タスク削除。

**検証**: 実機/エミュで Supabase に接続し、サインアップ → 支出/収入追加・編集 → 取引一覧 + 月次合計 →
両チャート → スケジュール作成 → 翌月分の自動生成（queue 行を手動で過去日付にして cron 関数実行）まで一気通貫。
内部テスト配信（Play internal / TestFlight）で数日運用。

**成果物**: アプリが完全に Supabase で動作。Go バックエンドは不要。

---

### フェーズ5: 後片付け・撤去（フェーズ4の内部テスト確認後）
**やること**
- `web/`（アカウント削除アプリ）: `delete_account_screen.dart` / `sign_in_screen.dart` を Supabase +
  `delete-account` Function 呼び出しに更新。envied キー差し替え。
- `git filter-repo --path backend/ --path ddl/ ...` で履歴を保持したまま新リポジトリ（例 `suito-go-backend`）へ分離。
- 本リポジトリから `backend/` / `ddl/` / `docker-compose*.yml` / backend CI（`suito_backend*.yml`）を削除。
- ルート `Makefile.toml` を整理（backend / migrate タスク削除、`supabase db push` / `functions deploy` 追加）。
- `README.org` / `Wiki.org` / `drawio/system2.drawio` を新構成に更新（Lightsail / SSM / nginx 記述を撤去）。
- Lightsail インスタンス・nginx・Lego 証明書・`api.suito...` の DNS レコードを撤去。Firebase プロジェクトをアーカイブ。

**成果物**: リポジトリは `mobile/` + `web/` + `supabase/` の3本立て。Lightsail 課金停止。

## Open items（着手前に決めること）

- **ソフトデリート**: `deleted_at` を全テーブルに残すか、参照テーブルからは外すか、いっそ全廃して
  Postgres の PITR / バックアップに任せるか。現アプリは UI からソフトデリート行を復元しない。
  → expense / income / *_schedule のみ残す案を推奨。
- **`income` の削除**: 現状 income には論理削除エンドポイントがない（物理削除のみ、削除ジョブが使用）。
  Supabase 移行を機に income にも delete を足すか、現挙動を維持するか。
- **FK の `on delete`**: カテゴリ削除時、現状は「参照を空文字化 + カテゴリは論理削除」。
  Postgres では `on delete set null` + カテゴリ物理削除がシンプル。UI 挙動が変わらないか要確認。
- **月軸パディング / トランザクションマージ**: SQL 関数に寄せるか Dart に残すか。
  → 保守する SQL を減らすため Dart に残す案を推奨。
- **`pg_uuidv7` 拡張の可用性**: プロジェクトで使えない場合の代替（SQL 定義 uuidv7 関数 / Postgres 18+ `uuidv7()`）を着手時に確定。
- **リアルタイム**: 現状未使用。今回はスキップ。

## 反映済みレビュー指摘（Gemini）

1. アカウント削除 → `SECURITY DEFINER` RPC ではなく Edge Function（Service Role Key）に統一。
2. `supabase_auth_ui` 不採用 → 既存 UI を維持し `auth` クライアント直呼び。
3. UUID は v4 ではなく **v7**（`pg_uuidv7`）でインデックス断片化回避 + id 時系列ソート維持。
4. queue テーブルはクライアントの書き込み権限を剥奪、トリガー / pg_cron のみ操作可。
5. 7日 Pause 対策の Keep-Alive GitHub Actions を初期から構築（pg_cron では回避不可）。
