#import "template.typ": *

#show: template.with(
  title: [Cosmic Note],
  short-title: "A simple template for Typst notes",
  description: [
    Winter 2026
  ],
  authors: (
    (
      name: "defly",
      github: "https://github.com/defly",
    ),
  ),
  bibliography-file: "refs.bib",
  // 恢复竖版 A4 纸
  paper-size: "a4",
  fonts: (
    (
      en-font: "Linux Libertine G",
      zh-font: "LXGW Bright", // 更换为系统安装的静态字体以消除 variable font 警告
      code-font: "DejaVu Sans Mono",
    )
  ),
  accent: rgb("#507EB3"), 
  cover-image: "./figures/cover-image2.jpg",
  background-color: rgb("#F5F7F9")
)

#include "content/01-introduction.typ"
#pagebreak()
#include "content/02-typography.typ"
#pagebreak()
#include "content/03-components.typ"
#pagebreak()
#include "content/04-showcase.typ"


