#import "@preview/showybox:2.0.4": showybox
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/ctheorems:1.1.3": *
#import "resource.typ": *

/*
  本模板修改自 jsk-lecnotes
    + 添加中文环境
    + 修改封面布局
    + 添加必要字体
*/

#let template(
  // 笔记标题
  title: "Lecture Notes Title",
  short-title: none,
  description: none,
  date: none,

  authors: (

  ),

  affiliations: (

  ),

  bibliography-file: none,
  bibstyle: "gb-7714-2015-numeric",

  // 默认采用横屏 A4 尺寸，更适合 Tufte 超宽边栏排版
  paper-size: "a4",
  flipped: true,
  // 边距设置：左侧 2.5cm，右侧 12.2cm 超大留白（用于放置 Tufte 侧边栏）
  page-margin: (left: 2.5cm, right: 12.2cm, top: 2.5cm, bottom: 2.5cm),

  fonts: (
    (
      en-font: "Linux Libertine G", // 可以回退到 Linux Libertine G 等
      zh-font: "LXGW Bright",     // 默认使用开源的霞鹜文楷/炫光
      code-font: "DejaVu Sans Mono",
    )
  ),

  accent: "#000000",
  cover-image: none,
  background-color: none,

  body
) = {

  let accent-color = rgb(accent)

  // 使用 ctheorems 包
  show: thmrules

  // 设置正文和代码的字体
  set text(font: (fonts.en-font, fonts.zh-font), size: 12pt, lang: "zh", region: "cn")
  show raw: set text(font: fonts.code-font, 10pt)

  // 设置中文粗体，斜体
  show strong: set text(fill: accent-color, font: (fonts.en-font, fonts.zh-font))
  show emph: set text(font: (fonts.en-font, fonts.zh-font))

  // 设置文档元数据
  set document(title: title, author: authors.map(author => author.name))

  // 将链接设置蓝色并加下划线，并且对于作者列表禁用此设置。
  show link: it => {
    let author-names = ()
    for author in authors {
      author-names.push(author.name)
    }

    if it.body.has("text") and it.body.text in author-names {
      it
    } else {
      underline(stroke: (dash: "densely-dotted"), text(fill: blue, it)) 
    }
  }

  // 文本高亮
  // set highlight(fill: accent-color.lighten(50%))

  // 计数器
  let chaptercounter = counter("chapter")

  // 配置页面
  set page(
    paper: paper-size,
    flipped: flipped,
    numbering: "1 / 1",
    number-align: center,
    // 页边距
    margin: page-margin,

    // 封面图片和背景图片
    background: context {
      if here().page() == 1 and cover-image != none {
        block(width:100%, height: 100%)[#image(cover-image, width: 100%, height: 100%)]
      } else if background-color != none{
        block(width:100%, height:100%, fill: rgb(background-color))
      }
    },

header: context {
    if here().page() == 1 {
      return
    }

    let elems = query(heading.where(level: 1).after(here()))

    let chapter-title = ""

    if (elems == () or elems.first().location().page() != here().page()) {
      let elems = query(heading.where(level: 1).before(here()))
      chapter-title = elems.last().body
    } else {
      chapter-title = elems.first().body
    }

    let head-title = text()[
      #if short-title != none {
        short-title
      } else {
        title
      }
    ]

    let header-content = {
      if calc.even(here().page()) == true {
        emph(chapter-title) + h(1fr) + emph(head-title)
      } else {
        emph(head-title) + h(1fr) + emph(chapter-title)
      }

      v(-8pt)
      // 横线铺满扩充后的整个区域
      align(center)[#line(length: 100%, stroke: (thickness: 1pt, dash: "solid"))]
    }

    // 利用负边距向右侧延伸，使页眉横跨正文区与侧边栏（横屏下延伸 11.2cm）
    pad(right: -11.2cm, header-content)

  },

    footer: context {
      if here().page() == 1 {return}
      [
        #if calc.even(here().page()) == true {
            align(left)[#counter(page).display("1 / 1",both: true,)]
        }else{
            align(right)[#counter(page).display("1 / 1",both: true,)]
        }
      ]
    })

  // 配置列表
  set list(tight: true, indent: 2em)
  show list: it => [
    #set text(top-edge: "ascender")
    #it
  ]

  set enum(tight: true, indent: 2em)
  show enum: it => [
    #set text(top-edge: "ascender")
    #it
  ]

  // 配置标题
  set heading(numbering: "1.1.1.1.1.")

  show heading: it => box(width: 100%)[
    #if it.numbering != none { counter(heading).display() }
    #it.body

    #if it.level == 1 and it.numbering != none{
      chaptercounter.step()
      counter(math.equation).update(0)
    }
  ]

  // 配置一级标题
  show heading.where(
    level: 1
  ): it => box(width: 100%)[
    #set align(left)
    #set text(fill: accent-color)
    #set heading(numbering: "章节 1. ")
    #it
    #v(-12pt)
    #line(length:100%, stroke: gray)
  ]

  // 配置公式的编号和间距
  set math.equation(numbering: (..nums) => (
    context {
      numbering("(1.1)", chaptercounter.at(here()).first(), ..nums)
    }
  ))


  show math.equation: eq => {
    set block(spacing: 0.65em)
    eq
  }

  // 配置图像和图像编号
  set figure(
    numbering: (..nums) => context {
      numbering("1.1", chaptercounter.at(here()).first(), ..nums)
    })


  // 配置表格
  set table(
    fill: (_, row) => if row == 0 {accent-color.lighten(40%)} else {accent-color.lighten(80%)},
    stroke: 1pt + white
  )

  // set figure(placement: auto)
  show figure.where(
    kind: table
  ): set figure.caption(position: bottom)
  show figure.where(
    kind: raw
  ): it => {
    set block(width: 100%, breakable: true)
    it
  }

  // 配置行内代码块
  show raw.where(
    block: false,
  ): it => box(fill: luma(245), inset: (x: 2pt), outset: (y: 3pt), radius: 1pt)[#it]

  show raw.where(block: true): it => sourcecode[#it]


  //------------------------------------------------------------------
  pad(right: -9.7cm, top: 15%)[
    #align(right)[
      #text(36pt, weight: "bold")[#title]
      
      #v(0.5em)
      
      #if description != none {
        text(size: 16pt, style: "italic")[#description]
      }
      
      #v(2em)
      
      #if authors.len() > 0 {
        box(inset: (y: 10pt), {
          authors.map(author => {
            text(16pt, weight: "semibold")[
              #if "homepage" in author {
                [#link(author.homepage)[#author.name]]
              } else { author.name }]
            if "affiliations" in author {
              super(author.affiliations)
            }
            if "github" in author {
              link(author.github, box(height: 1.1em, baseline: 13.5%)[#image(bytes(githubSvg))])
            }
          }).join(", ", last: {
            if authors.len() > 2 {
              ", and"
            } else {
              " and"
            }
          })
        })
      }
      
      #v(-2pt, weak: true)
      
      #if affiliations.len() > 0 {
        box(inset: (bottom: 10pt), {
          affiliations.map(affiliation => {
            text(12pt)[
              #super(affiliation.id)#h(1pt)#affiliation.name
            ]
          }).join(", ")
        })
      }

      #if date != none {
        text(12pt, date)
      }
    ]
  ]
  
  pagebreak()

  // 显示笔记的目录
  outline(indent: auto)

  
  v(24pt, weak: true)

  // 将段落设置为两端对齐，并设置换行。
  set par(justify: true, linebreaks: "optimized", first-line-indent:2em, leading: 0.8em)

  pagebreak()

  // 显示笔记的内容
  body

  // 显示参考文献
  if bibliography-file != none {
    pagebreak()
    show bibliography: set text(10.5pt)
    bibliography(bibliography-file, title: "参考文献", style: bibstyle) // apply bibstyle here.
  }
}


// 函数===========================================================

// 引入我们之前定义的配色，或者直接定义
#let abmCharcoal = rgb("#2C3E50") // 深炭色
#let abmDust = rgb("#F2F4F5")     // 尘埃灰（极浅）
#let abmSteel = rgb("#7F8C8D")    // 冷钢色

#let blockquote(cite: none, body) = [
  #set text(size: 10.5pt, style: "italic", fill: abmCharcoal.lighten(10%))
  #pad(left: 0.5em, y: 0.5em)[
    #block(
      breakable: true,
      width: 100%,
      fill: abmDust, 
      radius: 0pt, // 锐利边缘，拒绝软绵绵的圆角
      stroke: (
        left: 3pt + abmCharcoal, // 厚重的左侧生命线
        rest: 0.5pt + rgb("#D1D5D8") // 其余边框若有若无，像雾一样
      ),
      inset: (x: 1.5em, y: 1.2em)
    )[
      #body
      #if cite != none {
        set align(right)
        set text(size: 9pt, style: "normal", fill: abmSteel)
        v(0.5em)
        [--- #cite]
      }
    ]
  ]
]
// 水平标尺
#let horizontalrule = [#v(0.5em) #line(start: (20%,0%), end: (80%,0%)) #v(0.5em)]

// 另外的水平标尺
#let sectionline = align(center)[#v(0.5em) * \* #sym.space.quad \* #sym.space.quad \* * #v(0.5em)]

// removed quote-box to use theorion's

// ==== 使用 showybox 和 ctheorems 包创建盒子 ====
//
// |   环境   |  强调色                |
// |---------|-----------------------|
// |   定义   |  orange               |
// |   示例   |  blue                 |
// |   提示   |  olive                |
// |   注意   |  red                  |
// |   引用   |  eastern              |
// |   定理   |  yellow               |  
// |   命题   |  navy                 |

#let boxnumbering = "1.1.1.1.1.1"
#let boxcounting = "heading"

#let notebox(name, number, body, ntype, nicon, ncolor) = {
  showybox(
    title-style: (
      weight: 1000,
      color: ncolor.darken(20%),
      sep-thickness: 0pt,
    ),
    frame: (
      border-color: ncolor.darken(20%),
      title-color:  ncolor.lighten(80%),
      body-color:   ncolor.lighten(80%),
      thickness: (left: 4pt),
      radius: 4pt
    ),
    title: [#box(height: 0.85em)[#image(bytes(nicon))] #name #h(1fr) #ntype #number],
    body
  )
}

// --- 永恒寒冬色彩定义 ---
#let abmInk = rgb("#2C3E50")     // 深邃墨色：用于定义，稳重如山
#let abmAsh = rgb("#606F81")     // 灰烬：用于示例，低调平庸
#let abmMoss = rgb("#3E4A3D")    // 暗苔：用于提示，带有自然的一丝生机
#let abmOxide = rgb("#5D2A2C")   // 氧化铁：用于注意，警示但不刺眼
#let abmMist = rgb("#7F8C8D")    // 迷雾：用于引用，虚无缥缈
#let abmBrass = rgb("#746C58")   // 古铜：用于定理，如同剥落的圣像画
#let abmStorm = rgb("#1B2631")   // 风暴：用于命题，冰冷且不可撼动

// --- 环境定义修改 ---
#let definition = thmenv(
  "definition",
  boxcounting,
  2,
  (name, number, body) => {
    notebox(name, number, body, "定义", defSvg, abmInk)
  }
).with(numbering: boxnumbering)

#let example = thmenv(
  "example",
  boxcounting,
  2,
  (name, number, body, ..args) => {
    notebox(name, number, body, "示例", egSvg, abmAsh)
  }
).with(numbering: boxnumbering)

#let tip = thmenv(
  "tip",
  boxcounting,
  2,
  (name, number, body) => {
    notebox(name, number, body, "提示", tipSvg, abmMoss)
  }
).with(numbering: boxnumbering)

#let attention = thmenv(
  "attention",
  boxcounting,
  2,
  (name, number, body) => {
    notebox(name, number, body, "注意", cautionSvg, abmOxide)
  }
).with(numbering: boxnumbering)

#let quote = thmenv(
  "quote",
  boxcounting,
  2,
  (name, number, body) => {
    notebox(name, number, body, "引用", quoteSvg, abmMist)
  }
).with(numbering: boxnumbering)

#let theorem = thmenv(
  "theorem",
  boxcounting,
  2,
  (name, number, body) => {
    notebox(name, number, body, "定理", thmSvg, abmBrass)
  }
).with(numbering: boxnumbering)

#let proposition = thmenv(
  "proposition",
  boxcounting,
  2,
  (name, number, body) => {
    notebox(name, number, body, "命题", propSvg, abmStorm)
  }
).with(numbering: boxnumbering)

#show heading.where(level: 1): it => {
  // 这里的 it 代表标题本身
  pagebreak(weak: true) // 核心：在标题之前触发分页
  it
}