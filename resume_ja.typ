// ------------------------------------------------------------
// 0. テンプレート読み込み
// ------------------------------------------------------------
#import "@preview/typographic-resume:0.1.0": *

// ------------------------------------------------------------
// 日本語フォント設定 (macOS Hiragino fonts)
// 明朝体: Hiragino Mincho ProN (本文用)
// ゴシック体: Hiragino Kaku Gothic ProN (見出し用)
// ------------------------------------------------------------
#set text(
  font: ("Hiragino Mincho ProN", "Hiragino Kaku Gothic ProN"),
  lang: "ja",
)

#show heading: set text(font: "Hiragino Kaku Gothic ProN")

// ------------------------------------------------------------
// 1. カスタムヘルパー
// ------------------------------------------------------------
#let bullet-item(txt, indent-level: 0) = text(indent-level * " " +  "• " + txt + "\n", size: 8pt)


#let work-entry(timeframe: "", title: "", organization: "", location: "", body) = {
  let header = stack(
    spacing: 8pt,
    text(organization, weight: "bold") + text(" ") +
    text(title, style: "italic", size: 9pt) + " / " +
    text(timeframe + " · " + location, style: "italic", size: 9pt),
  )
  let desc = stack(body)
  stack(spacing: 10pt, header, desc)
}

// ------------------------------------------------------------
// 2. 共通プロフィール＆テーマ
// ------------------------------------------------------------
#let base-theme = (
  font-size: 10pt,
  line-height: 1.25,
  text-color: rgb("#333"),
  main-width: 6fr,
  aside-width: 3fr,
  gutter-size: 2em,
)

#let base-profile = (
  first-name: "Jaeyeol Lee",
  last-name: none,
  profession: text("Software Engineer", weight: "bold"),
  bio:
    text("") + text("人のためのソフトウェア\n", weight: "bold") + text("実用的なソフトウェア\n", weight: "bold") + text("今すぐ使いたいソフトウェア\n", weight: "bold") + "を作ることを目指す開発者です。\n\n良い製品作りを目指しているため\n技術は問いません。"

)

// ------------------------------------------------------------
// 3. ページ① — 経歴＆学歴
// ------------------------------------------------------------
#let page1 = resume(
  ..base-profile,
  theme: base-theme,
  // -------- サイドバー --------
  aside: {
    section(
      theme: (
        space-above: 10fr,
      ),
      "Contact",
      {
        set image(width: 8pt)
        contact-entry(github-icon, link("https://github.com/malkoG", "github.com/malkoG"))
        line(stroke: 0.1pt, length: 100%)
        contact-entry(phone-icon,  link("tel:+82-xx-xxx-xxxx", "xxx-xxxx-xxxx"))
        line(stroke: 0.1pt, length: 100%)
        contact-entry(email-icon,  link("mailto:jaeyeol.lee@hey.com", "jaeyeol.lee@hey.com"))
        line(stroke: 0.1pt, length: 100%)
        contact-entry("\u{1F310}",  link("https://hackers.pub/@kodingwarrior", "@kodingwarrior@hackers.pub"))
      },
    )


    section(
      theme: (
        space-above: 16pt,
      ),
      "Tech Stack",
      {
        set text(size: 9pt)
        stack(
          spacing: 8pt,
          "Ruby & Ruby On Rails ",
          "Python & Django",
          "TypeScript & React",
          "Flutter",
          "PostgreSQL",
          "Vim/Neovim/CLI Tooling",
        )
      },
    )

    section(
      theme: (
        space-above: 16pt,
      ),
      "LANGUAGES",
      [#language-entry("Korean", "Native") #language-entry("English", "Intermediate") #language-entry("Japanese", "Beginner")],
    )

    section(
      theme: (
        space-above: 16pt,
      ),
      "Interests",
      {
        set text(size: 10pt)
        stack(
          spacing: 8pt,
          "OSS Community",
          "Mathematics",
          "Fediverse",
          "Developer Experience (DX)",
        )
      },
    )
  },

  // -------- 本文(main) --------
  [
    #section(
      theme: (
        space-above: 0pt,
      ),
      "Work Experience",
      stack(
        spacing: 12pt,
        work-entry(
          timeframe: "2022.12 – Present",
          title: "Software Engineer",
          organization: "Team Milestone",
          location: "Seoul",
          {
            pad(text("アイデアを素早く製品化する2人体制のフルスタック開発エージェンシー", size: 8pt), bottom: 0pt)
            pad(text("Ruby On Railsベースのソフトウェア保守\n", weight: "light", size: 8pt), top: -0pt, bottom: 0pt)
            bullet-item("大学向けLMSプラットフォーム（Canvas LMS基盤）の保守")
            bullet-item("YouTubeクリエイター精算管理プラットフォームの保守")
            bullet-item("HEYGROUND施設予約サービスの保守")
            pad(text("Node.js/Ruby On Rails/Flutterベースのソフトウェア受託開発\n", weight: "light", size: 8pt), top: 1pt, bottom: 0pt)

            bullet-item("食事管理向けデリバリーアプリのパブリッシング")
            bullet-item("農水産物ECプラットフォームの開発")
            bullet-item("LLMベースのタロットアプリサービスのプロトタイプ開発")
            bullet-item("中古衣類取引プラットフォームの開発")
            bullet-item("動物病院予約サービスアプリの開発（スタッフ・顧客用）")
            bullet-item("アスリート向け食事管理プラットフォームの開発")
            bullet-item("美容店舗向けCRMソリューションの開発")
            pad(text("Team Milestone内部の開発プロセス改善\n", weight: "light", size: 8pt), top: 1pt, bottom: 0pt)

            bullet-item("CapistranoベースのデプロイからKamalベースのデプロイへ移行")
            bullet-item("本番環境構築からデプロイまでの時間を5時間から1時間に短縮", indent-level: 1)
            bullet-item("バックオフィスを迅速に構築するためのDSLベースライブラリを自社開発")
          },
        ),

        work-entry(
          timeframe: "2022.02 - 2022.10",
          title: "Software Engineer",
          organization: "Makers The",
          location: "Seoul",
          {
            pad(
              text("メディアコンテンツ産業向けソリューションを開発。技術スタック: ", size: 8pt) +
              text("Django, React(TypeScript)", size: 8pt, weight: "black") +
              text("\n", size: 8pt),
              bottom: 2pt
            )
            bullet-item("ストック画像・動画ホスティングサービスの保守")
            bullet-item("英語塾向けLMS（Learning Management System）の開発")
            bullet-item("電子書籍レンタルサービスの保守（Spring + React）")
            bullet-item("撮影機材・教育スペース予約プラットフォームの開発")
          }
        ),

        work-entry(
          timeframe: "2021.01 – 2021.04",
          title: "Softeware Engineer",
          organization: "Kodebox Co., Ltd.",
          location: "Seoul",
          {
            pad(text("株主名簿管理・登記書類自動化SaaSを開発。技術スタック: ", size: 8pt) + text("Django, GraphQL, React(TS)", size: 8pt, weight: "black") + text("\n", size: 8pt), bottom: 2pt)
            bullet-item("株主名簿管理・株主総会/登記書類自動化SaaS開発")
            bullet-item("商法等の法律ドメイン知識をビジネスロジックに反映")
            pad(
            rect(text("SW開発者として足りない点を客観的に理解できた貴重な経験。B2B企業でキャリアを続けたいと思うように。業務と学業の両立が難しく、試用期間3ヶ月終了時に自主退職。", size: 7pt), stroke: (dash: "dashed")), left: 12pt)

          },
        ),

        work-entry(
          timeframe: "2020.05 – 2021.01, 2021.04 - 2021.11",
          title: "Software Engineer",
          organization: "Petner Co.",
          location: "Seoul",
          {
            pad(text("ペットオーナーとペットシッターをマッチングするサービス開発。技術スタック: ", size: 8pt) + text("Ruby On Rails, jQuery, Flutter", size: 8pt, weight: "black") + text("\n", size: 8pt), bottom: 2pt)
            bullet-item("RailsベースのペットシッターマッチングサービスのAPI保守")
            bullet-item("売上ダッシュボード・地域別現況パネル等のバックオフィス開発")
            bullet-item("通知メッセージ送信プロセスをDBベースで自動化＆Slack連携")
            bullet-item("Iamport定期決済API導入による決済自動化")
            bullet-item("Flutterベースのモバイルアプリ機能開発のサポート")
            bullet-item("Next.jsベースのアプリリンクPoCページの開発")
          },
        ),

        work-entry(
          timeframe: "2019.08 – 2020.04",
          title: "Software Engineer",
          organization: "SCVSoft",
          location: "Seoul",
          {
            pad(text("ブロックチェーン専門家で構成されたR&Dチーム。企業向けソリューション・インフラコンサルを提供。", size: 8pt), bottom: 2pt)

            bullet-item("Vueベースのブロックチェーンウォレット・管理ポータルの開発")
            bullet-item("React NativeベースのIoTアプリの開発")
          },
        ),

        work-entry(
          timeframe: "2018.12 – 2019.02",
          title: "Software Engineer Intern",
          organization: "Grepp Co.",
          location: "Seoul",
          {
            pad(text("Programmers、Hashcode等の開発者向けサービスを提供。技術スタック: ", size: 8pt) + text("Ruby On Rails, jQuery(CoffeeScript)", size: 8pt, weight: "black") + text("\n", size: 8pt), bottom: 2pt)
            bullet-item("TokBoxベースのビデオコーディング面接機能の実装")
            bullet-item("Hashcode検索/質問ページに求人広告のレコメンド機能を追加")
            bullet-item("GitHubリポジトリ分析用Rubyライブラリの開発")
          },
        ),
      )
    )
  ],
)

// ──────────────────────────────────────────────
// 2カラム最適化：同名ヘルパーの再定義
// ──────────────────────────────────────────────
#let _header_row(left, right) = grid(
  columns: (1fr, auto),
  align: (start, end),
  text(left, weight: "bold"),
  text(right, style: "italic", size: 8pt),
)

#let project-entry(title: "", timeframe: "", summary: "", body: "", techstack: "") = stack(
  spacing: 8pt,
  _header_row(title, timeframe),
  text(techstack, style: "italic", size: 7.5pt),
  if (body == "") {
    text(summary, size: 8pt)
  } else {
    stack(
      spacing: 8pt,
      text(summary, size: 8pt),
      body,
    )
  },
)

#let contribution-entry(project, detail) = stack(
  spacing: 8pt,
  text(project, weight: "semibold", size: 8.5pt),
  text(detail, size: 8pt),
)

#let community-entry(role, timeframe, detail) = pad(
  stack(
    spacing: 8pt,
    _header_row(role, timeframe),
    detail, // 内部は既存のbullet-item/textをそのまま使用
  ),
  bottom: 4pt
)

#let education-entry(major: "", institution: "", timeframe: "", body) = stack(
  spacing: 8pt,
  _header_row(institution, timeframe),
  text(major, style: "italic", size: 8pt),
  stack(body, spacing: 2pt),
)

// ──────────────────────────────────────────────
// page2: 2カラムレイアウトで再構成
// ──────────────────────────────────────────────
#let page2 = resume(
  theme: (
    font-size: 10pt,
    line-height: 1.25,
    aside-width: 0fr,
    gutter-size: 0fr,
    text-color: rgb("#333"),
    margin: 0pt,
  ),
  aside: none,
  pad(
    top: 20pt,
    bottom: 28pt,
    left: 28pt,
    right: 28pt,
    grid(
      columns: 2,
      column-gutter: 10pt,

      // ─ Left Column ─
      stack(
        spacing: 12pt,
        section(
          theme: (space-above: 0pt),
          "Projects",
          stack(
            spacing: 14pt,
            project-entry(
              title: "Cosmoslide " + underline(text(link("https://github.com/cosmoslide/cosmoslide", "github.com/cosmoslide/cosmoslide"), weight: "thin", size: 6pt)),
              summary: "ActivityPubベースのFediverse向けスライド共有プラットフォーム",
              timeframe: "2025.07 - Present",
              techstack: "Typescript, NestJS, Next.js, ActivityPub",
              body: stack(
                spacing: 8pt,
                bullet-item(
                  indent-level: 1,
                  "Mac Miniサーバーで運用中 (" + underline(link("https://v1.cosmosli.de", "v1.cosmosli.de")) + ")"
                ),
                bullet-item(
                  indent-level: 3,
                  "Caddyをリバースプロキシとして活用、docker-composeベースでデプロイ"
                ),
                bullet-item(
                  indent-level: 1,
                  "ActivityPubベースの他サービスとの互換性を提供 " + text("(Mastodon, Hackers' Pub等)", size: 6pt)
                )
              )
            ),
            project-entry(
              title: "個人ブログ運営 " + underline(text(link("https://kodingwarrior.github.io", "kodingwarrior.github.io"), weight: "thin", size: 6pt)),
              summary: "Rubyベースの静的サイトジェネレーターBridgetownで個人ブログを運営",
              timeframe: "2022.03 ~ Present",
              techstack: "Ruby, Javascript",
              body: stack(
                spacing: 8pt,
                bullet-item(indent-level: 1, "telekasten.nvim互換のPKMシステム構築（内部リンク・可視化対応）"),
                bullet-item(indent-level: 1, "Hackers' Pubベースの静的コンテンツ自動生成に対応")
              )
            ),
            project-entry(
              title: "Aladin IT Book Notifier " + underline(text(link("https://t.me/@aladin_itbook_notifier", "t.me/@aladin_itbook_notifier"), weight: "thin", size: 6pt)),
              summary: "新刊IT書籍のTelegram通知Bot",
              timeframe: "2024.04",
              techstack: "Ruby, Rails",
              body: ""
            ),
            project-entry(
              title: "Mastodon.nvim " + underline(text(link("https://github.com/kode-team/mastodon.nvim", "github.com/kode-team/mastodon.nvim"), weight: "thin", size: 6pt)),
              summary: "Neovim用Mastodonプラグイン",
              timeframe: "2022.12",
              techstack: "Lua, Neovim",
              body: ""
            ),
            project-entry(
              title: "Mazassumnida " + underline(text(link("https://github.com/mazassumnida/mazassumnida", "github.com/mazassumnida/mazassumnida"), weight: "thin", size: 6pt)),
              summary: "BOJティアを可視化するGitHubバッジ、GitHub Star 600達成",
              timeframe: "2020.08",
              techstack: "Python, Django",
              body: ""
            ),
          )
        ),
        section(
          theme: (space-above: 10pt),
          "Contributions",
          stack(
            spacing: 14pt,
            contribution-entry(
              "Hackers' Pub " + underline(text(link("https://github.com/hackers-pub/hackerspub", "github.com/hackers-pub/hackerspub"), weight: "thin", size: 6pt)),
              stack(
                spacing: 8pt,
                text("ActivityPubプロトコル対応のFediverse向けブログプラットフォーム", size: 8pt),
                bullet-item(
                  indent-level: 1,
                  "下書き保存インジケーター "
                  +
                  text(link("https://github.com/hackers-pub/hackerspub/pull/5", "#5"), size: 7pt, fill: red)
                  +
                  "、"
                  +
                  "招待状メール送信エラー修正 "
                  +
                  text(link("https://github.com/hackers-pub/hackerspub/pull/138", "#138"), size: 7pt, fill: red)
                  +
                  " 等のUX改善作業"
                ),
                bullet-item(
                  indent-level: 1,
                  "登録者数増加のためのバイラル活動 " +
                  text("(2025-10-16時点、677名中257名を招待)", size: 7pt)
                ),
                bullet-item(
                  indent-level: 1,
                  "Hackers' PubベースのSSG連携サンプル作成 "
                  + underline(text(link("https://github.com/kodingwarrior-hackerspub/kodingwarrior-hackerspub.github.io", "(リポジトリ)"), size: 7pt))
                ),

                bullet-item(
                  indent-level: 3,
                  "GraphQL API活用で静的コンテンツ自動生成する構造を設計"
                )
              )
            ),
            contribution-entry(
              "Fedify " + underline(text(link("https://github.com/fedify-dev/fedify", "github.com/fedify-dev/fedify"), weight: "thin", size: 6pt)),
              stack(
                spacing: 8pt,
                par(
                  leading: 8pt,
                  "Node.js/Deno/Bun等のJS WebフレームワークでActivityPubサービスを開発するためのミドルウェア"
                ),
                bullet-item(indent-level: 1, "2025年度OSSCA課程でリードメンティーとして活動"),
                bullet-item(
                  indent-level: 1,
                  "Nest.JS統合サポート ("
                  + text(link("https://github.com/fedify-dev/fedify/pull/309", "#309"), size: 8pt, fill: red)
                  + ", "
                  + text(link("https://github.com/fedify-dev/fedify/pull/386", "#386"), size: 8pt, fill: red) + ") 及びサンプルプロジェクト開発(cosmoslide)",
                ),
              )
            ),
            contribution-entry(
              "Aider " + underline(text(link("https://github.com/Aider-AI/aider", "github.com/Aider-AI/aider)"), weight: "thin", size: 6pt)),
              "LLMベースのペアプログラミングエージェント — Dart/Flutterサポートを追加 " +
              text(link("https://github.com/Aider-AI/aider/pull/2236", "#2236"), size: 8pt, fill: red)
            ),
            contribution-entry(
              "tree-sitter-dart " + underline(text(link("https://github.com/UserNobody14/tree-sitter-dart", "github.com/UserNobody14/tree-sitter-dart"), weight: "thin", size: 6pt)),
              "tree-sitterベースのDart言語パーサー — tag queryサポート " +
              text(link("https://github.com/UserNobody14/tree-sitter-dart/pull/77", "#77"), size: 8pt, fill: red)
            ),
            contribution-entry(
              "Django Girls Tutorial " + underline(text(link("https://tutorial.djangogirls.org/ko", "tutorial.djangogirls.org/ko"), weight: "thin", size: 6pt)),
              stack(
                "Django 1.1基準のチュートリアルをDjango 2.0基準にアップデート " +
                text(link("https://github.com/DjangoGirls/tutorial/pull/1476", "#1476"), size: 8pt, fill: red)
              )
            ),
            contribution-entry(
              "Elixir School " + underline(text(link("https://elixirschool.com/ko/", "elixirschool.com/ko"), weight: "thin", size: 6pt)),
              "Elixir入門者向けチュートリアルの韓国語翻訳 " +
              text(link("https://github.com/elixirschool/elixirschool/pull/465", "#465"), size: 8pt, fill: red) +
              text(", ", size: 8pt) +
              text(link("https://github.com/elixirschool/elixirschool/pull/467", "#467"), size: 8pt, fill: red) +
              text(", ", size: 8pt) +
              text(link("https://github.com/elixirschool/elixirschool/pull/581", "#581"), size: 8pt, fill: red) +
              text(", ", size: 8pt) +
              text(link("https://github.com/elixirschool/elixirschool/pull/623", "#623"), size: 8pt, fill: red)
            ),

          )
        ),

      ),

      // ─ Right Column ─
      stack(
        spacing: 12pt,
        section(
          theme: (space-above: 0pt),
          "Education",
          grid(
            columns: 1,
            column-gutter: default-theme.margin,
            education-entry(
              institution: "弘益大学校",
              major: "コンピュータ工学 学士",
              timeframe: "2012.03 – 2022.02",
              {
                bullet-item("ゲームサークル makE X Play活動 " + text("(~ 2017. 02.)", style: "italic", size: 7pt))
                bullet-item("アルゴリズム研究会 HI-ARC 創設メンバー及び2期会長")
                bullet-item("Application Platform Lab 学部研究員 " + text("(2017. 07. ~ 2018. 05.)", style: "italic", size: 7pt) + "")
                set text(size: 8pt)
                pad({
                  text("兵役休学 ") + text("2014. 04. ~ 2016. 03.", size: 6pt) + " / " + text("開発キャリア集中のための休学 ") + text("2018. 12. ~ 2021. 02.", size: 6pt)
                }, top: 4pt)
              },
            ),
          ),
        ),
        section(
          theme: (space-above: 10pt),
          "Extracurricular Activities",
          education-entry(
            institution: "弘益大学校アルゴリズム研究会 HI-ARC",
            major: "弘益大学校",
            timeframe: "2017.03 – 2021.02",
            {
              bullet-item("2期会長及びスタディ長 — 新入生向けアルゴリズム講義・スタディ運営 " +
                underline(link("https://www.slideshare.net/JaeyeolLee4", "(link)")))
              bullet-item("第1回弘益大プログラミングコンテスト問題出題 ('16)")
              bullet-item("ACM-ICPC、UCPC、カカオコードフェスティバル等の大会に参加")
              bullet-item("西江大ICPCチームと2020年冬季合同スタディ（講義・問題選定）")
              bullet-item("新村地域サークル連合 ICPC Sinchon夏季キャンプ共同総括")
            }
          )
        ),

        section(
          theme: (space-above: 10pt),
          "Community",
          {
            community-entry(
              "Fedidev.kr モデレーター " + underline(text(link("https://fedidev.kr", "(link)"), weight: "thin", size: 8pt)),
              "2024.01 – present",
              stack(
                spacing: 8pt,
                bullet-item("ActivityPubベースの分散型SNS開発者コミュニティを運営"),
                bullet-item("Hackers' Pubオフライン交流会 Hackers' Publicを主催 " + underline(text(link("https://public.hackers.pub", "(link)"), weight: "thin", size: 7pt))),
                bullet-item("定期スプリントミーティングの企画・主催 " + underline(text(link("https://fedidev.kr", "(link)"), weight: "thin", size: 7pt))),
                bullet-item("(UbuCon Korea 2025) 「OSS開発者はなぜFediverseに集まるのか？」発表")
              )
            )

            community-entry(
              "Vim.kr モデレーター " + underline(text(link("https://vim.kr", "(link)"), weight: "thin", size: 8pt)),
              "2023.01 - present",
              stack(
                spacing: 8pt,
                text("韓国語圏Vim/NeovimユーザーDiscordコミュニティ(630+)運営\n", size: 8pt),
                text("Vim関連イベント3回主催、発表多数\n", size: 8pt),
                bullet-item("(第2回エクセルコン) Neovimで生産性をクォンタムジャンプ"),
                bullet-item("(チューリングのりんご招待講演) Vim、どこまで知ってる？"),
                bullet-item("(VimEnter 2023) Neovimで生産性をクォンタムジャンプ pt.2"),
                bullet-item("(NeovimConf.live 2024) You don't need plugin, long live the command line"),
                bullet-item("(UbuCon Korea 2025) 2025年Ubuntu環境でのエディターと未来"),
              )
            )

            community-entry(
              "PyCon KR 準備委員会",
              "2018.10 – 2020.10",
              bullet-item("PyCon KR 2019・2020及び隔月セミナーの企画・運営")
            )

            community-entry(
              "Django Girls Seoul コーチ",
              "2018.08, 2019.08",
              bullet-item("女性向け無料プログラミングワークショップでコーチとして活動")
            )
            community-entry(
              "etc",
              "",
              bullet-item("(PyCon Korea 2025) 「Aiderと一緒にAI-driven pair programming」発表")
            )
          }
        ),



      ),
    )
  ),
)

#let page3 = resume(
  theme: (
    space-above: 0,
    font-size: 10pt,
    line-height: 1.25,
    aside-width: 0fr,
    text-color: rgb("#333"),
  ),
  aside: none,
  [



  ],
)

// ------------------------------------------------------------
// 5. 出力：ページ1 → ページ分離 → ページ2
// ------------------------------------------------------------
#show: [
  #page1
  #page2
  // #page3
]
