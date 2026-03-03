#import "template.typ": *



#show: template.with(
  // 笔记标题
  title: [强化学习初步],
  // 在页眉展示的短标题（选填）
  short-title: "Reinforcement learning",
  // 笔记描述（选填）
  description: [
    Winter 2025
  ],
  // 笔记创建日期（选填）
  
  // 作者信息
  authors: (
    (
      name: "defly",
      github: "https://github.com/defly",
    ),
  ),
  // 所属组织列表

  // 参考书目文件路径及引用样式
  bibliography-file: "refs.bib",
  bibstyle: "gb-7714-2015-numeric",
  // 页面尺寸
  paper-size: "a4",
  // 字体设置
  fonts: (
    (
      en-font: "Linux Libertine",
      //zh-font: "LXGW Bright",
      zh-font: "Noto Sans CJK SC",
      code-font: "DejaVu Sans Mono",
    )
  ),
  
  // --- 大师级调色区域 ---
  
  // 主题色：我将原本廉价的亮橙色换成了"冷钢蓝"。
  // 这提取自你封面图中的超链接颜色，能保持视觉的一致性，且符合"金属"的冷峻感。
  accent: rgb("#507EB3"), 

  // 封面背景图片
  cover-image: "./figures/aedrian-salazar-M9jRi3Yc3kY-unsplash.jpg",

  // 正文背景颜色：关键修改！
  // 既然是浅色模式，绝对不能用纯白。
  // 我提取了封面图最顶部的迷雾颜色，加入了极微量的冷灰。
  // #F5F7F9 -> 这种颜色叫"Geistergrau" (幽灵灰)，护眼且高级。
  background-color: rgb("#F5F7F9")
)

//#include "content/chapter1.typ"
//#pagebreak()
//#include "content/chapter2.typ"
//#pagebreak()
#include "content/chapter4.typ"
#pagebreak()
#include "content/chapter5.typ"
#pagebreak()
#include "content/chapter3.typ"
#pagebreak()
#include "content/chapter6.typ"
#pagebreak()
#include "content/chapter7.typ"

