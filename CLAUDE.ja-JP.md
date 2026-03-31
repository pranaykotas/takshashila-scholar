# Claude Scholar 設定

## プロジェクト概要

**Claude Scholar** - 学術研究とソフトウェア開発のための半自動リサーチアシスタント

**ミッション**: Claude Code、OpenCode、Codex CLIをサポートし、アイデア創出、コーディング、実験、執筆、出版、プラグイン開発、プロジェクト管理を横断的に支援。

---

## ユーザー背景

### 学術的背景
- **学位**: コンピュータサイエンス博士
- **ターゲット学会**:
  - トップカンファレンス: NeurIPS, ICML, ICLR, KDD
  - ハイインパクトジャーナル: Nature, Science, Cell, PNAS
- **重点**: 学術的ライティング品質、論理的一貫性、自然な表現

### 技術スタック

**Python エコシステム**:
- **パッケージマネージャー**: `uv` - モダンPythonパッケージマネージャー
- **設定管理**: Hydra + OmegaConf（設定合成、オーバーライド、型安全性）
- **モデル学習**: Transformers Trainer

**Git 標準**:
- **コミット規約**: Conventional Commits
  ```
  Type: feat, fix, docs, style, refactor, perf, test, chore
  Scope: data, model, config, trainer, utils, workflow
  ```
- **ブランチ戦略**: master/develop/feature/bugfix/hotfix/release
- **マージ戦略**: featureブランチ同期にはrebase、統合にはmerge --no-ff

---

## グローバル設定

### 言語設定
- **ユーザーへの応答は英語で行う**
- 技術用語は英語のまま保持（例: NeurIPS, RLHF, TDD, Git）
- 固有名詞や人名は翻訳しない

### 作業ディレクトリ標準
- 計画文書: `/plan`フォルダ
- 一時ファイル: `/temp`フォルダ
- フォルダが存在しない場合は自動作成

### タスク実行原則
- 複雑なタスクを分解する前にアプローチを議論
- 実装後にテスト例を実行
- バックアップを作成し、既存機能を壊さない
- 完了後に一時ファイルをクリーンアップ

### 作業スタイル
- **タスク管理**: TodoWriteで進捗を追跡、複雑なタスクは事前に計画、既存スキルを優先的に使用
- **コミュニケーション**: 不明な点は積極的に質問、重要な操作前に確認、Hook強制ワークフローに従う
- **コードスタイル**: PythonはPEP 8準拠、コメントは英語、識別子は英語

---

## コアワークフロー

### 研究ライフサイクル（7段階）

```
アイデア創出 → ML開発 → 実験分析 → 論文執筆 → セルフレビュー → 投稿/リバッタル → アクセプト後処理
```

| 段階 | コアツール | コマンド |
|------|-----------|----------|
| 1. リサーチアイデア創出 | `research-ideation` skill + `literature-reviewer` agent + Zotero MCP | `/research-init`, `/zotero-review`, `/zotero-notes` |
| 2. MLプロジェクト開発 | `architecture-design` skill + `code-reviewer` agent | `/plan`, `/commit`, `/tdd` |
| 3. 実験分析 | `results-analysis` skill + `results-report` skill | `/analyze-results` |
| 4. 論文執筆 | `ml-paper-writing` skill + `paper-miner` agent | `/mine-writing-patterns` |
| 5. セルフレビュー | `paper-self-review` skill | - |
| 6. 投稿とリバッタル | `review-response` skill + `rebuttal-writer` agent | `/rebuttal` |
| 7. アクセプト後処理 | `post-acceptance` skill | `/presentation`, `/poster`, `/promote` |

### サポートワークフロー

- **自動化**: 5つのHooksがセッションライフサイクルの各段階で自動トリガー（スキル評価、環境初期化、作業サマリー、セキュリティチェック）
- **Zotero連携**: Zotero MCPを通じた自動論文インポート、コレクション管理、フルテキスト読解、引用エクスポート
- **Obsidianナレッジベース**: 文献、計画、デイリーログ、実験、結果、執筆、アーカイブ管理のための内蔵ファイルシステムファーストプロジェクトナレッジベース。コンパクトなVault構造でMCP不要
- **知識抽出**: `paper-miner`と`kaggle-miner`エージェントが論文やコンペティションから継続的に知識を抽出
- **スキル進化**: `skill-development` → `skill-quality-reviewer` → `skill-improver`の3ステップ改善ループ

### Obsidianプロジェクトナレッジベースルール

- 現在のリポジトリに`.claude/project-memory/registry.yaml`が含まれている場合、自動的に`obsidian-project-memory`を起動し、Obsidianをこのリポジトリのデフォルトプロジェクトナレッジベースとして扱う
- リポジトリがまだバインドされていないが研究プロジェクトのように見える場合、自動的に`obsidian-project-bootstrap`を起動しVaultにインポート
- 実質的なプロジェクトターンごとに、少なくともデイリーノートとリポジトリローカルのプロジェクトメモリファイルを更新。`00-Hub.md`はトップレベルのプロジェクトステータスが本当に変わった場合にのみ更新
- このワークフローで追加のObsidian API設定やAPIキーを要求しない

---

## スキルディレクトリ（47スキル）

### 🔬 研究と分析（5スキル）

- **research-ideation**: 研究スタートアップ（5W1H、文献レビュー、ギャップ分析、研究課題策定、Zotero連携）
- **results-analysis**: 厳密な実験分析（厳格な統計、科学的図表、アブレーション研究）
- **results-report**: 実験後の完全なサマリーレポート（振り返り、意思決定支援、Obsidian結果レポート）
- **citation-verification**: 引用検証（多層: フォーマット→API→情報→内容）
- **daily-paper-generator**: 研究追跡のためのデイリーペーパージェネレーター

### 📝 論文執筆と出版（7スキル）

- **ml-paper-writing**: ML/AI論文執筆支援
  - トップカンファレンス: NeurIPS, ICML, ICLR, ACL, AAAI, COLM
  - ジャーナル: Nature, Science, Cell, PNAS
- **writing-anti-ai**: AIライティングパターンの除去、バイリンガル対応（中国語/英語）
- **paper-self-review**: 論文セルフレビュー（6項目品質チェックリスト）
- **review-response**: 体系的リバッタル執筆
- **post-acceptance**: アクセプト後処理（プレゼンテーション、ポスター、プロモーション）
- **doc-coauthoring**: ドキュメント共同執筆ワークフロー
- **latex-conference-template-organizer**: LaTeX学会テンプレート整理

### 💻 開発ワークフロー（6スキル）

- **daily-coding**: デイリーコーディングチェックリスト（ミニマルモード、自動トリガー）
- **git-workflow**: Gitワークフロー標準（Conventional Commits、ブランチ管理）
- **code-review-excellence**: コードレビューベストプラクティス
- **bug-detective**: デバッグとエラー調査（Python, Bash/Zsh, JavaScript/TypeScript）
- **architecture-design**: MLプロジェクトコードアーキテクチャとデザインパターン
- **verification-loop**: 検証ループとテスト

### 🔌 プラグイン開発（8スキル）

- **skill-development**: スキル開発ガイド
- **skill-improver**: スキル改善ツール
- **skill-quality-reviewer**: スキル品質レビュー
- **command-development**: スラッシュコマンド開発
- **plugin-structure**: プラグイン構造ガイド
- **agent-identifier**: エージェント開発設定
- **hook-development**: Hook開発とイベントハンドリング
- **mcp-integration**: MCPサーバー統合

### 🧪 ツールとユーティリティ（4スキル）

- **planning-with-files**: Markdownファイルによる計画と進捗追跡
- **uv-package-manager**: uvパッケージマネージャーの使用方法
- **webapp-testing**: ローカルWebアプリケーションテスト
- **kaggle-learner**: Kaggleコンペティション学習

### 🧠 Obsidianナレッジベース（11スキル）

- **obsidian-project-memory**: リポジトリバインドの研究作業用デフォルトObsidianプロジェクトメモリオーケストレーター
- **obsidian-project-bootstrap**: 研究リポジトリをObsidianプロジェクトナレッジベースにブートストラップまたはインポート
- **obsidian-research-log**: デイリーノート、計画、ハブ更新、永続的な進捗ルーティング
- **obsidian-experiment-log**: 実験、アブレーション、結果のログ記録
- **obsidian-link-graph**: 正規ノート間のwikilink修復用レガシー互換ヘルパー
- **obsidian-synthesis-map**: 上位レベルの合成ノートと比較サマリー用レガシー互換ヘルパー
- **obsidian-project-lifecycle**: デタッチ、アーカイブ、パージ、ノートレベルのライフサイクル操作
- **zotero-obsidian-bridge**: Zoteroコレクション/フルテキストをObsidian論文ノートとデフォルトの`Maps/literature.canvas`にブリッジ
- **obsidian-literature-workflow**: プロジェクトVault内の論文ノート正規化と文献レビュー
- **obsidian-markdown**: ベンダリングされた公式Obsidian Flavored Markdownスキル
- **obsidian-cli**: ベンダリングされた公式Obsidian CLIスキル
- **obsidian-bases / json-canvas / defuddle**: `.base`、`.canvas`、クリーンなWeb→Markdown抽出のベンダリングされた公式オプションサポート

### 🎨 Webデザイン（3スキル）

- **frontend-design**: 独自性のある本番品質のフロントエンドインターフェース作成
- **ui-ux-pro-max**: UI/UXデザインインテリジェンス（50以上のスタイル、97パレット、57フォントペアリング、9スタック）
- **web-design-reviewer**: レスポンシブ、アクセシビリティ、レイアウトの問題に対するビジュアルWebサイト検査

---

## コマンド（50以上）

### 研究ワークフローコマンド

| コマンド | 機能 |
|---------|------|
| `/research-init` | Zotero連携のリサーチアイデア創出ワークフローを開始（コレクション自動作成、論文インポート、フルテキスト分析） |
| `/zotero-review` | Zoteroコレクションから論文を読解し、Obsidian文献レビューと下流プロジェクトノートに合成 |
| `/zotero-notes` | Zotero論文を一括読解し、詳細なObsidian論文ノートを作成/更新し`Maps/literature.canvas`を更新 |
| `/obsidian-init` | 現在の研究リポジトリ用にObsidianプロジェクトナレッジベースをブートストラップまたはインポート |
| `/obsidian-ingest` | 新しいMarkdownファイルまたはディレクトリを分類→昇格/マージ/デイリーステージングで取り込み |
| `/obsidian-review` | Obsidian論文ノートからプロジェクトリンク付き文献合成を生成 |
| `/obsidian-notes` | 論文ノートを正規化し、プロジェクト知識、実験、結果に接続 |
| `/obsidian-sync` | リポジトリ、プロジェクトメモリ、Obsidian間のインクリメンタルまたは完全修復同期を強制実行 |
| `/obsidian-link` | 正規ノート間のプロジェクトwikilinkを修復または強化 |
| `/obsidian-note` | 単一の正規ノートをアーカイブ、パージ、またはリネーム |
| `/obsidian-project` | プロジェクトナレッジベースのデタッチ、アーカイブ、パージ、または再構築 |
| `/obsidian-views` | オプションの`.base`ビューと追加キャンバスを明示的に生成 |
| `/analyze-results` | 実験結果の分析（統計検定、可視化、アブレーション） |
| `/rebuttal` | 体系的なリバッタル文書を生成 |
| `/presentation` | 学会プレゼンテーションのアウトラインを作成 |
| `/poster` | 学術ポスターデザインを生成 |
| `/promote` | プロモーションコンテンツを生成（Twitter, LinkedIn, ブログ） |

### 開発ワークフローコマンド

| コマンド | 機能 |
|---------|------|
| `/plan` | 実装計画を作成 |
| `/commit` | コードをコミット（Conventional Commits準拠） |
| `/update-github` | コミットしてGitHubにプッシュ |
| `/update-readme` | READMEドキュメントを更新 |
| `/code-review` | コードレビュー |
| `/tdd` | テスト駆動開発ワークフロー |
| `/build-fix` | ビルドエラーを修正 |
| `/verify` | 変更を検証 |
| `/checkpoint` | チェックポイントを作成 |
| `/refactor-clean` | リファクタリングとクリーンアップ |
| `/learn` | コードから再利用可能なパターンを抽出 |
| `/create_project` | 新規プロジェクトを作成 |
| `/setup-pm` | パッケージマネージャーを設定（uv/pnpm） |
| `/update-memory` | CLAUDE.mdメモリを確認・更新 |

### SuperClaudeコマンドスイート（`/sc`）

- `/sc agent` - エージェントディスパッチ
- `/sc analyze` - コード分析
- `/sc brainstorm` - インタラクティブブレインストーミング
- `/sc build` - プロジェクトビルド
- `/sc business-panel` - ビジネスパネル
- `/sc cleanup` - コードクリーンアップ
- `/sc design` - システム設計
- `/sc document` - ドキュメント生成
- `/sc estimate` - 工数見積もり
- `/sc explain` - コード説明
- `/sc git` - Git操作
- `/sc help` - ヘルプ情報
- `/sc implement` - 機能実装
- `/sc improve` - コード改善
- `/sc index` - プロジェクトインデックス
- `/sc index-repo` - リポジトリインデックス
- `/sc load` - コンテキスト読み込み
- `/sc pm` - パッケージマネージャー操作
- `/sc recommend` - ソリューション提案
- `/sc reflect` - 振り返りサマリー
- `/sc research` - 技術リサーチ
- `/sc save` - コンテキスト保存
- `/sc select-tool` - ツール選択
- `/sc spawn` - サブタスク生成
- `/sc spec-panel` - スペックパネル
- `/sc task` - タスク管理
- `/sc test` - テスト実行
- `/sc troubleshoot` - 問題トラブルシューティング
- `/sc workflow` - ワークフロー管理

---

## エージェント（16エージェント）

### 研究ワークフローエージェント

- **literature-reviewer** - 文献検索、分類、トレンド分析（Zotero MCP連携: 自動インポート、フルテキスト読解）
- **literature-reviewer-obsidian** - Obsidianプロジェクトナレッジベースからのファイルシステムファースト文献レビュー
- **research-knowledge-curator-obsidian** - Obsidianにおけるプロジェクト計画、デイリーログ、文献、実験、結果、執筆のデフォルトキュレーター
- **rebuttal-writer** - トーン最適化付きの体系的リバッタル執筆
- **paper-miner** - 成功した論文からライティング知識を抽出

### 開発ワークフローエージェント

- **architect** - システムアーキテクチャ設計
- **build-error-resolver** - ビルドエラー修正
- **bug-analyzer** - コード実行フローの深層分析と根本原因調査
- **code-reviewer** - コードレビュー
- **dev-planner** - 開発タスクの計画と分解
- **refactor-cleaner** - コードリファクタリングとクリーンアップ
- **tdd-guide** - TDDワークフローガイダンス
- **kaggle-miner** - Kaggleソリューションからエンジニアリングプラクティスを抽出

### デザインとコンテンツエージェント

- **ui-sketcher** - UIブループリント設計とインタラクション仕様
- **story-generator** - ユーザーストーリーと要件生成

---

## Hooks（5 Hooks）

自動化ワークフロー実行のためのクロスプラットフォームNode.js Hooks:

| Hook | トリガー | 機能 |
|------|---------|------|
| `session-start.js` | セッション開始 | Git状態、TODO、コマンド、バインドされたObsidianプロジェクトメモリ状態を表示 |
| `skill-forced-eval.js` | 毎回のユーザー入力 | 全利用可能スキルを強制評価し、研究ターンでバインドされたリポジトリのObsidianキュレーターフローをヒント |
| `session-summary.js` | セッション終了 | 作業ログを生成、CLAUDE.md更新を検出、バインドされたリポジトリの最低限Obsidian書き戻しをリマインド |
| `stop-summary.js` | セッション停止 | クイック状態チェック、一時ファイル検出、バインドされたリポジトリのObsidianメンテナンスリマインダー |
| `security-guard.js` | ファイル操作 | セキュリティ検証（キー検出、危険なコマンドのインターセプト） |

---

## ルール（4ルール）

グローバル制約、常に有効:

| ルールファイル | 目的 |
|-------------|------|
| `coding-style.md` | MLプロジェクトコード標準: 200-400行ファイル、イミュータブル設定、型ヒント、Factory & Registryパターン |
| `agents.md` | エージェントオーケストレーション: 自動起動タイミング、並列実行、多角的分析 |
| `security.md` | セキュリティ標準: キー管理、機密ファイル保護、pre-commitセキュリティチェック |
| `experiment-reproducibility.md` | 実験再現性: ランダムシード、設定記録、環境記録、チェックポイント管理 |

---

## 命名規則

### スキル命名
- フォーマット: kebab-case（小文字+ハイフン）
- 形式: 動名詞形を優先（verb+ing）
- 例: `scientific-writing`, `git-workflow`, `bug-detective`

### タグ命名
- フォーマット: Title Case
- 略語は全て大文字: TDD, RLHF, NeurIPS, ICLR
- 例: `[Writing, Research, Academic]`

### 説明文の標準
- 人称: 三人称
- 内容: 目的とユースケースを含む
- 例: "Provides guidance for academic paper writing, covering top-venue submission requirements"

---

## タスク完了サマリー

各タスク完了後、簡潔なサマリーを積極的に提供:

```
📋 操作レビュー
1. [主要操作]
2. [変更ファイル]

📊 現在のステータス
• [Git/ファイルシステム/ランタイムの状態]

💡 次のステップ
1. [具体的な提案]
```
