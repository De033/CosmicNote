#import "../index.typ": *
#import "../tufted.typ"

= 高级组件与全宽排版

== 定理环境容器

在撰写数学或计算机科学笔记时，我们经常需要强调特定的定理或定义。CosmicNote 深度整合了 `showybox` 与 `ctheorems`，并为其配置了一套独特的“永恒寒冬”配色系统。

#definition("马尔可夫性质 (Markov Property)")[
  当一个随机过程在给定现在状态及所有过去状态情况下，其未来状态的条件概率分布仅依赖于当前状态。这就称为马尔可夫性质。
]

#theorem("中心极限定理")[
  设从均值为 $mu$、方差为 $sigma^2$ (有限) 的任意一个总体中抽取样本量为 $n$ 的样本，当 $n$ 充分大时，样本均值的抽样分布近似服从均值为 $mu$、方差为 $sigma^2 / n$ 的正态分布。
]

#tip("为什么使用横屏？")[
  你会发现，横屏状态下这些盒子的宽度刚刚好。它们既不会因为行长太长而导致阅读疲劳，又留出了足够的空间来展示复杂的数学公式。
]

== 全宽排版 (Full-width)

最后，我们要展示横屏 Tufte 排版中的一项终极武器—— *全宽环境*。

当你有一张极其巨大的图表，或者想要营造一种宏大的视觉隔断感时，你可以使用 `#tufted.full-width[]` 宏。它会让内容无视原有的正文边界，直接向右伸展，霸占整个侧边栏区域。

#tufted.full-width[
  #box(
    width: 100%, 
    fill: rgb("#2C3E50"), 
    inset: 3em,
    radius: 4pt,
  )[
    #align(center)[
      #text(fill: white, size: 24pt, weight: "bold")[
        这是一块横跨整个屏幕的 "Full-width" 全宽区域
      ]
      
      #v(1em)
      
      #text(fill: rgb("#D1D5D8"), size: 14pt)[
        打破边界，延伸视界。在这里放入宽大而复杂的数据表格或全景配图，再合适不过了。
      ]
    ]
  ]
]

#v(2em)

感谢您的使用。这就是 CosmicNote 想要带给您的现代学术排版体验。祝您写作愉快！