// ------------------------------------------------------------
// 0. 템플릿 불러오기
// ------------------------------------------------------------
#import "@preview/typographic-resume:0.1.0": *

// ------------------------------------------------------------
// 1. 커스텀 헬퍼
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
// 2. 공통 프로필 & 테마
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
    text("") + text("사람을 위한 소프트웨어\n", weight: "bold") + text("실용적인 소프트웨어\n", weight: "bold") + text("내가 당장 쓰고 싶은 소프트웨어\n", weight: "bold") + "만드는 것을 지향하는 개발자입니다.\n\n좋은 제품을 만드는 것을 지향하기 때문에\n사용하는 기술은 가리지 않습니다."
  
)

// ------------------------------------------------------------
// 3. 페이지 ① — 경력 & 학력
// ------------------------------------------------------------
#let page1 = resume(
  ..base-profile,
  theme: base-theme,
  // -------- 사이드바 --------
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
      [#language-entry("Korean", "Native") #language-entry("English", "Intermediate") ],
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

  // -------- 본문(main) --------
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
            pad(text("아이디어를 제품으로 빠르게 전환하는 2인 풀스택 개발 에이전시 Team Milestone에서 근무했습니다.", size: 8pt), bottom: 0pt)
            pad(text("Ruby On Rails 기반의 소프트웨어 유지보수\n", weight: "light", size: 8pt), top: -0pt, bottom: 0pt)
            bullet-item("서울 소재 대학교 LMS 플랫폼(Canvas LMS 기반) 유지보수")
            bullet-item("유튜브 크리에이터 정산 관리 플랫폼 유지보수")
            bullet-item("헤이그라운드 대관 서비스 유지보수")
            pad(text("Node.js/Ruby On Rails/Flutter 기반의 소프트웨어 위탁개발\n", weight: "light", size: 8pt), top: 1pt, bottom: 0pt)
            
            bullet-item("식단 관리를 위한 배달 앱 퍼블리싱")
            bullet-item("농수산물 이커머스 플랫폼 개발")
            bullet-item("LLM 기반 타로 앱 서비스 프로토타입 개발")
            bullet-item("중고의류 거래 플랫폼 개발")
            bullet-item("동물병원 예약 서비스 앱 개발(스태프·고객 전용)")
            bullet-item("운동선수 식단관리 플랫폼 개발")
            bullet-item("뷰티 매장을 위한 CRM 솔루션 개발")
            pad(text("Team Milestone 내부 개발 프로세스 개선\n", weight: "light", size: 8pt), top: 1pt, bottom: 0pt)
            
            bullet-item("Capistrano 기반의 배포 방식에서 kamal 기반의 배포 방식으로 전환")
            bullet-item("운영환경 구축부터 배포까지 드는 시간을 5시간에서 1시간으로 개선", indent-level: 1)
            bullet-item("백오피스를 빠르게 구축하기 위한 DSL 기반의 라이브러리 자체 제작")
          },
        ),

        work-entry(
          timeframe: "2022.02 - 2022.10",
          title: "Software Engineer",
          organization: "Makers The",
          location: "Seoul",
          {
            pad(
              text("미디어 콘텐츠 산업을 위한 솔루션을 개발하는 ", size: 8pt) +
              text("Makers The", size: 8pt, weight: "black") +
              text("에서 근무했으며, 주로 위탁 개발 중심의 프로젝트를 수행했습니다. 개발스택은 ", size: 8pt) +
              text("Django", size: 8pt, weight: "black") +
              text(", ", size: 8pt) +
              text("React(TypeScript) ", size: 8pt, weight: "black") +
              text("였습니다.\n", size: 8pt),
              bottom: 2pt
            )
            bullet-item("스톡 이미지 및 영상 호스팅 서비스 유지보수")
            bullet-item("영어 학원용 LMS(Learning Management System) 개발")
            bullet-item("전자책 대여 서비스 유지보수 (Spring + React)")
            bullet-item("촬영 장비 및 교육 공간 대여 플랫폼 개발")
          }
        ),

        work-entry(
          timeframe: "2021.01 – 2021.04",
          title: "Softeware Engineer",
          organization: "Kodebox Co., Ltd.",
          location: "Seoul",
          {
            pad(text("주식회사의 주주명부 관리하고 주주총회 및 법인등기 문서 생성을 자동화하는 서비스, 주주리걸을 개발하는 (주)코드박스에서 근무했습니다. 개발스택은 ", size: 8pt) + text("Django, GraphQL, React(Typescript) ", size: 8pt, weight: "black") + text("였습니다.\n", size: 8pt), bottom: 2pt)
            bullet-item("주주명부 관리·주주총회/등기 문서 자동화 SaaS 개발")
            bullet-item("상법 등 법률 도메인 지식을 흡수해 비즈니스 로직에 반영")
            pad(
            rect(text("SW 개발자로서 어떤 점이 부족했었는지 객관적으로 이해할 수 있었고, B2B 회사에서 커리어를 이어가고 싶은 생각이 들었던 귀중한 경험이었습니다. 업무와 학업을 병행하기 어려운 나머지, 수습기간 3개월 끝나는 시점에 자진퇴사했습니다.", size: 7pt), stroke: (dash: "dashed")), left: 12pt)

          },
        ),

        work-entry(
          timeframe: "2020.05 – 2021.01, 2021.04 - 2021.11",
          title: "Software Engineer",
          organization: "Petner Co.",
          location: "Seoul",
          {
            pad(text("반려동물 보호자와 펫시터를 매칭하는 서비스 펫트너를 개발하는 (주)펫트너에서 근무했습니다.\n개발스택은 ", size: 8pt) + text("Ruby On Rails, jQuery, Flutter ", size: 8pt, weight: "black") + text("였습니다.\n", size: 8pt), bottom: 2pt)
            bullet-item("Rails 기반 펫시터 매칭 서비스 서버 유지보수")
            bullet-item("매출 대시보드·지역별 현황판 등 백오피스 개발")
            bullet-item("알림톡 발송 프로세스를  DB 기반으로 자동화 및 Slack 연동")
            bullet-item("Iamport 정기결제 API 도입으로 결제 자동화")
            bullet-item("Flutter 기반의 모바일 앱 기능 개발 보조")
            bullet-item("Next.js 기반 앱링크 PoC 페이지 개발")
          },
        ),

        work-entry(
          timeframe: "2019.08 – 2020.04",
          title: "Software Engineer",
          organization: "SCVSoft",
          location: "Seoul",
          {
            pad(text("블록체인 전문가로 구성된 R&D 팀으로서 기업 맞춤형 솔루션·보안·인프라 컨설팅을 제공하는 SCVSoft에서 근무했습니다.", size: 8pt), bottom: 2pt)
            
            bullet-item("Vue 기반 블록체인 지갑·어드민 포털 개발")
            bullet-item("React Native 기반 IoT 앱 개발")
          },
        ),

        work-entry(
          timeframe: "2018.12 – 2019.02",
          title: "Software Engineer Intern",
          organization: "Grepp Co.",
          location: "Seoul",
          {
            pad(text("프로그래머스, 해시코드 등 개발자를 위한 서비스를 제공하는 그렙에서 근무했습니다.\n개발스택은 ", size: 8pt) + text("Ruby On Rails, jQuery(CoffeeScript) ", size: 8pt, weight: "black") + text("였습니다.\n", size: 8pt), bottom: 2pt)
            bullet-item("TokBox 기반 화상 코딩 인터뷰 기능 구현")
            bullet-item("Hashcode 검색/질문 페이지에 채용공고 추천 광고 추가")
            bullet-item("GitHub 저장소 분석 Ruby 라이브러리 개발")
          },
        ),
      )
    )
  ],
)

// ──────────────────────────────────────────────
// 2-Column 최적화: 동일한 이름의 헬퍼 재정의
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
    detail, // 내부는 기존 bullet-item/text 그대로 사용
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
// page2: 2-Column 레이아웃으로 재구성
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
              summary: "ActivityPub 기반의 연합우주 생태계를 위한 슬라이드 공유 플랫폼",
              timeframe: "2025.07 - Present",
              techstack: "Typescript, NestJS, Next.js, ActivityPub",
              body: stack(
                spacing: 8pt,
                bullet-item(
                  indent-level: 1,
                  "Mac Mini 서버에서 운영 (" + underline(link("https://v1.cosmosli.de", "v1.cosmosli.de")) + ")"
                ),
                bullet-item(
                  indent-level: 3,
                  "Caddy를 리버스 프록시로 활용하며, docker-compose 기반으로 배포"
                ),
                bullet-item(
                  indent-level: 1,
                  "ActivityPub 기반 다른 서비스와의 호환성 제공 " + text("(Mastodon, Hackers' Pub 등)", size: 6pt)
                )
              )
            ),
            project-entry(
              title: "개인 블로그 운영 " + underline(text(link("https://kodingwarrior.github.io", "kodingwarrior.github.io"), weight: "thin", size: 6pt)),
              summary: "Ruby 기반의 정적사이트 생성기 Bridgetown 기반으로 개인 블로그 운영",
              timeframe: "2022.03 ~ Present",
              techstack: "Ruby, Javascript",
              body: stack(
                spacing: 8pt,
                bullet-item(indent-level: 1, "telekasten.nvim과 호환되는 PKM 시스템 구축 (내부링크 및 시각화 지원)"),
                bullet-item(indent-level: 1, "Hackers' Pub 기반의 정적 컨텐츠 자동 생성 지원")
              )
            ),
            project-entry(
              title: "Aladin IT Book Notifier " + underline(text(link("https://t.me/@aladin_itbook_notifier", "t.me/@aladin_itbook_notifier"), weight: "thin", size: 6pt)),
              summary: "신간 IT 도서 텔레그램 알림 봇",
              timeframe: "2024.04",
              techstack: "Ruby, Rails",
              body: ""
            ),
            project-entry(
              title: "Mastodon.nvim " + underline(text(link("https://github.com/kode-team/mastodon.nvim", "github.com/kode-team/mastodon.nvim"), weight: "thin", size: 6pt)),
              summary: "Neovim용 Mastodon 플러그인",
              timeframe: "2022.12",
              techstack: "Lua, Neovim",
              body: ""
            ),
            project-entry(
              title: "Mazassumnida " + underline(text(link("https://github.com/mazassumnida/mazassumnida", "github.com/mazassumnida/mazassumnida"), weight: "thin", size: 6pt)),
              summary: "BOJ 티어를 시각화하는 GitHub 뱃지, GitHub Star 600 달성",
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
                text("ActivityPub 프로토콜 호환되는 연합우주 생태계의 블로깅 플랫폼", size: 8pt),
                bullet-item(
                  indent-level: 1, 
                  "초안 저장 표시자 "
                  + 
                  text(link("https://github.com/hackers-pub/hackerspub/pull/5", "#5"), size: 7pt, fill: red)
                  + 
                  ", "
                  +
                  "초대장 메일 발송 오류 수정 "
                  + 
                  text(link("https://github.com/hackers-pub/hackerspub/pull/138", "#138"), size: 7pt, fill: red)
                  +
                  " 등 UX 개선 작업"
                ),
                bullet-item(
                  indent-level: 1,
                  "가입자 수를 늘리기 위한 바이럴 활동 " +
                  text("(2025-10-16 기준, 677명 중 257명 초대)", size: 7pt)
                ),
                bullet-item(
                  indent-level: 1,
                  "Hackers’ Pub 기반 정적 사이트 생성기(SSG) 연동 예제 제작 "
                  + underline(text(link("https://github.com/kodingwarrior-hackerspub/kodingwarrior-hackerspub.github.io", "(예제 저장소)"), size: 7pt))
                ),
                
                bullet-item(
                  indent-level: 3,
                  "GraphQL API를 응용해 정적 컨텐츠가 자동 생성되도록 구조 설계"
                )
              )
            ),
            contribution-entry(
              "Fedify " + underline(text(link("https://github.com/fedify-dev/fedify", "github.com/fedify-dev/fedify"), weight: "thin", size: 6pt)),
              stack(
                spacing: 8pt,
                par(
                  leading: 8pt,
                  "Node.js/Deno/Bun 등의 Javascript 웹 서버 프레임워크에서 ActivityPub 기반의 서비스를 개발하기 위한 유틸리티를 제공해주는 미들웨어"
                ),
                bullet-item(indent-level: 1, "2025년도 OSSCA 과정에서 리드멘티로 활동"),
                bullet-item(
                  indent-level: 1,
                  "Nest.JS 통합 지원 (" 
                  + text(link("https://github.com/fedify-dev/fedify/pull/309", "#309"), size: 8pt, fill: red)
                  + ", "
                  + text(link("https://github.com/fedify-dev/fedify/pull/386", "#386"), size: 8pt, fill: red) + ") 및 예제 프로젝트 개발(cosmoslide)",
                ),
              )
            ),
            contribution-entry(
              "Aider " + underline(text(link("https://github.com/Aider-AI/aider", "github.com/Aider-AI/aider)"), weight: "thin", size: 6pt)),
              "LLM 기반 페어프로그래밍 에이전트 — Dart/Flutter 지원 추가 " +
              text(link("https://github.com/Aider-AI/aider/pull/2236", "#2236"), size: 8pt, fill: red)
            ),
            contribution-entry(
              "tree-sitter-dart " + underline(text(link("https://github.com/UserNobody14/tree-sitter-dart", "github.com/UserNobody14/tree-sitter-dart"), weight: "thin", size: 6pt)),
              "tree-sitter 기반 dart language parser — tag query 지원 " +
              text(link("https://github.com/UserNobody14/tree-sitter-dart/pull/77", "#77"), size: 8pt, fill: red)
            ),
            contribution-entry(
              "Django Girls Tutorial " + underline(text(link("https://tutorial.djangogirls.org/ko", "tutorial.djangogirls.org/ko"), weight: "thin", size: 6pt)),
              stack(
                "django 1.1 기준의 튜토리얼을 django 2.0 기준으로 업데이트 " +
                text(link("https://github.com/DjangoGirls/tutorial/pull/1476", "#1476"), size: 8pt, fill: red)
              )
            ),
            contribution-entry(
              "Elixir School " + underline(text(link("https://elixirschool.com/ko/", "elixirschool.com/ko"), weight: "thin", size: 6pt)),
              "Elixir 입문자들을 위한 튜토리얼 한국어 번역 " +
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
              institution: "홍익대학교",
              major: "컴퓨터공학 학사",
              timeframe: "2012.03 – 2022.02",
              {
                bullet-item("게임 동아리 makE X Play 활동 " + text("(~ 2017. 02.)", style: "italic", size: 7pt))
                bullet-item("알고리즘 학회 HI-ARC 창설 멤버 및 2기 학회장")
                bullet-item("Application Platform Lab 학부 연구원 " + text("(2017. 07. ~ 2018. 05.)", style: "italic", size: 7pt) + "")
                set text(size: 8pt)
                pad({
                  text("군휴학 ") + text("2014. 04. ~ 2016. 03.", size: 6pt) + " / " + text("개발 커리어 집중을 위한 휴학 ") + text("2018. 12. ~ 2021. 02.", size: 6pt)
                }, top: 4pt)
              },
            ),
          ),
        ),        
        section(
          theme: (space-above: 10pt),
          "Extracurricular Activities",
          education-entry(
            institution: "홍익대학교 알고리즘 학회 HI-ARC",
            major: "홍익대학교",
            timeframe: "2017.03 – 2021.02",
            {
              bullet-item("2기 학회장 및 스터디장 — 신입생 대상 알고리즘 강의·스터디 운영 " +
                underline(link("https://www.slideshare.net/JaeyeolLee4", "(link)")))
              bullet-item("제1회 홍익대 프로그래밍 경진대회 문제 출제 ('16)")
              bullet-item("ACM-ICPC, UCPC, 카카오 코드 페스티벌 등 대회 참여")
              bullet-item("서강대 ICPC 팀과 2020 겨울 연합 스터디(강의·문제 선정)")
              bullet-item("신촌 지역 동아리 연합 ICPC Sinchon 여름 캠프 공동총괄")
            }
          )
        ),

        section(
          theme: (space-above: 10pt),
          "Community",
          {
            community-entry(
              "Fedidev.kr 모더레이터 " + underline(text(link("https://fedidev.kr", "(link)"), weight: "thin", size: 8pt)),
              "2024.01 – present",
              stack(
                spacing: 8pt,
                bullet-item("ActivityPub 기반 Mastodon 등 분산 SNS 개발자 커뮤니티 운영"),
                bullet-item("Hackers' Pub 오프라인 모임 Hackers' Public 주최 " + underline(text(link("https://public.hackers.pub", "(link)"), weight: "thin", size: 7pt))),
                bullet-item("정기 스프린트 모임 기획·주최 " + underline(text(link("https://fedidev.kr", "(link)"), weight: "thin", size: 7pt))),
                bullet-item("(UbuCon Korea 2025) '글로벌 OSS 개발자들은 왜 Fediverse에 모일까?' 발표")
              )
            )

            community-entry(
              "Vim.kr 모더레이터 " + underline(text(link("https://vim.kr", "(link)"), weight: "thin", size: 8pt)),
              "2023.01 - present",
              stack(
                spacing: 8pt,
                text("한국어권 Vim/Neovim 사용자 Discord 커뮤니티(630+) 운영\n", size: 8pt),
                text("Vim 관련 행사 3회 주최 및 발표 다수\n", size: 8pt),
                bullet-item("(제 2회 엑셀콘) Neovim으로 생산성 퀀텀점프하기"),
                bullet-item("(튜링의 사과 초청 강연) Vim 어디까지 알고 있니?"),
                bullet-item("(VimEnter 2023) Neovim으로 생산성 퀀텀점프하기 pt.2"),
                bullet-item("(NeovimConf.live 2024) You don’t need plugin, long live the command line"),
                bullet-item("(UbuCon Korea 2025) 2025 우분투 환경에서의 에디터 그리고 미래"),
              )
            )

            community-entry(
              "PyCon KR 준비위원회",
              "2018.10 – 2020.10",
              bullet-item("PyCon KR 2019·2020 및 격월 세미나 기획·운영")
            )

            community-entry(
              "Django Girls Seoul 코치",
              "2018.08, 2019.08",
              bullet-item("여성을 위한 무료 프로그래밍 워크숍, Django Girls Seoul에서 코치로 활동")
            )
            community-entry(
              "etc",
              "",
              bullet-item("(PyCon Korea 2025) Aider와 함께하는 AI-driven pair programming 발표")
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
// 5. 출력: 페이지 1 → 페이지 분리 → 페이지 2
// ------------------------------------------------------------
#show: [
  #page1
  #page2
  // #page3
]

